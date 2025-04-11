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
    # "tac\nString\n"
    # "1\n2\n3\nArray\n"
    #"45\nInteger\n",
   # "true\nfalse\nArray\n"

  type = response.rpartition("\n")[0].rpartition("\n")[-1]
  result = response.rpartition("\n")[0].rpartition("\n")[0]

  case type
  when 'String'
    result
  when 'Array'
      stringified_collection = "[" + result.strip.gsub("\n", ",") + "]"
      JSON.parse(stringified_collection)
  when 'Hash'
  when 'Integer'
    result.to_i
  when 'Float'
    result.to_f
  when 'Symbol'
    result.map(&:to_sym)
  when 'TrueClass', 'FalseClass'
    JSON.parse(result)
  else
    result
  end


  end

  def prepare_type_for_comparison(type, content)
  end

  def compare_output(expected_output_value, actual_output_value)
    expected_output_value == actual_output_value
  end
end
