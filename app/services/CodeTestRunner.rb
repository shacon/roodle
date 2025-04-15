class CodeTestRunner
  def initialize(content, prompt_id)
    @prompt = Prompt.find(prompt_id)
    @content = content
    @test_cases = @prompt.test_suite.test_cases
  end

  def generate_result_hash
    results = []
    @test_cases.each do |test_case|
      response = PistonClient.call(
        input: test_case.prepared_input,
        expected_output_type: test_case.expected_output_type,
        content: @content
      )
      parsed_response = JSON.parse(response.body)
      actual_output = parsed_response["run"]["output"]
      error_status = parsed_response["run"]["stderr"]
      parsed_output = actual_output
      if error_status.empty?
        parsed_output = convert_response_to_type(actual_output)
      end
      passed = if error_status.empty?
        compare_output(
          test_case.expected_output_value,
          parsed_output
        )
      else
        false
      end

      result = {
        passed: passed,
        input: test_case.input_value,
        expected_output_value: test_case.expected_output_value,
        actual_output: parsed_output,
        stderr: error_status
      }
      results << result
    end
    Rails.logger.info("Results: #{results}")
    results
  end

  def convert_response_to_type(response)
    type = response.rpartition("\n")[0].rpartition("\n")[-1]
    result = response.rpartition("\n")[0].rpartition("\n")[0]
    Rails.logger.info("Type is: #{type}")

    case type
    when "String"
      result
    when "Array"
        stringified_collection = "[" + result.strip.gsub("\n", ",") + "]"
        JSON.parse(stringified_collection)
    when "Hash"
      parse_hash(result)
    when "Integer"
      result.to_i
    when "Float"
      result.to_f
    when "Symbol"
      result.map(&:to_sym)
    when "TrueClass", "FalseClass"
      JSON.parse(result)
    else
      result
    end
  end

  def parse_hash(result)
    Rails.logger.info("testing result: #{result.inspect}")
    Rails.logger.info("testing resultc lass: #{result.class}")

    # Try to parse as JSON first, otherwise use our custom parser
    begin
      # Clean up the string if needed
      if result.include?("=>")
        custom_parse_hash(result)
      else
        JSON.parse(result)
      end
    rescue => e
      Rails.logger.error("Failed to parse hash: #{e.message}")
      {}
    end
  end

  def custom_parse_hash(hash_str)
    # Basic parser for Ruby hash syntax
    return {} if hash_str.nil? || hash_str.empty?

    # Clean the string
    clean_str = hash_str.strip
    # Remove outer braces if present
    clean_str = clean_str[1..-2] if clean_str.start_with?("{") && clean_str.end_with?("}")

    result = {}
    # Split the string using regex that respects nested structures
    items = split_hash_items(clean_str)

    items.each do |item|
      next if item.empty?

      key_value = item.split("=>", 2)
      next if key_value.length < 2

      key = key_value[0].strip
      value = key_value[1].strip

      # Clean quotes from key if needed
      key = key[1..-2] if key.start_with?('"') && key.end_with?('"')

      # Parse value based on type
      if value == "nil"
        result[key] = nil
      elsif value == "true"
        result[key] = true
      elsif value == "false"
        result[key] = false
      elsif value =~ /^\d+$/
        result[key] = value.to_i
      elsif value =~ /^\d+\.\d+$/
        result[key] = value.to_f
      elsif value.start_with?('"') && value.end_with?('"')
        result[key] = value[1..-2]
      elsif value.start_with?("[") && value.end_with?("]")
        # Parse array
        result[key] = split_array_items(value[1..-2])
      elsif value.start_with?("{") && value.end_with?("}")
        # Recursive parse for nested hash
        result[key] = custom_parse_hash(value)
      else
        result[key] = value
      end
    end

    result
  end

  def split_hash_items(str)
    items = []
    current = ""
    level = 0
    in_quotes = false
    escape_next = false

    str.each_char do |c|
      if escape_next
        current << c
        escape_next = false
      elsif c == "\\" && !escape_next
        current << c
        escape_next = true
      elsif c == '"' && !escape_next
        current << c
        in_quotes = !in_quotes
      elsif !in_quotes
        if c == "{" || c == "["
          level += 1
          current << c
        elsif c == "}" || c == "]"
          level -= 1
          current << c
        elsif c == "," && level == 0
          items << current.strip
          current = ""
        else
          current << c
        end
      else
        current << c
      end
    end
    items << current.strip unless current.strip.empty?
    items
  end

  def split_array_items(str)
    items = split_hash_items(str)
    items.map do |item|
      if item == "nil"
        nil
      elsif item == "true"
        true
      elsif item == "false"
        false
      elsif item =~ /^\d+$/
        item.to_i
      elsif item =~ /^\d+\.\d+$/
        item.to_f
      elsif item.start_with?('"') && item.end_with?('"')
        item[1..-2]
      elsif item.start_with?("[") && item.end_with?("]")
        split_array_items(item[1..-2])
      elsif item.start_with?("{") && item.end_with?("}")
        custom_parse_hash(item)
      else
        item
      end
    end
  end

  def compare_output(expected_output_value, actual_output_value)
    Rails.logger.info "Expected: #{PP.pp(expected_output_value, '')} - Actual: #{PP.pp(actual_output_value, '')}"
    if expected_output_value.is_a?(Hash) && actual_output_value.is_a?(Hash)
        expected_output_value.sort.to_h == actual_output_value.sort.to_h
    end
    expected_output_value == actual_output_value
  end
end
