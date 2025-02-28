class CodeTestRunner
  def initialize(content, prompt_id)
    @prompt = Prompt.find(prompt_id)
    @content = content
  end

  def generate_result_hash
    results = []
    @prompt.test_suite.test_cases.each do |test_case|
      response = PistonClient.call(
        input: test_case.prepared_input,
        input_type: test_case.input_type,
        expected_output_type: test_case.expected_output_type,
        content: @content
      )
      parsed_response = JSON.parse(response.body)
      actual_output = parsed_response["run"]["output"]
      error_status = parsed_response["run"]["stderr"]
      parsed_output = actual_output
      if error_status.empty?
        parsed_output = parse_actual_output(actual_output, test_case.expected_output_type)
      end
      passed = if error_status.empty?
        compare_output(
          test_case.input_type,
          test_case.expected_output_type,
          test_case.expected_output_value,
          actual_output
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

    results
  end

  def parse_actual_output(actual, expected_output_type)
    case expected_output_type
    when "string"
      actual.strip.gsub(/\\"|"/, '')
    when "float","integer"
      actual.to_f
    when "array"
      actual
      begin
        JSON.parse(actual)
      rescue JSON::ParserError
        actual
      end
    else
      actual
    end
  end

  def compare_output(expected_type, expected_output_type, expected_output_value, actual)
    parsed_actual = parse_actual_output(actual, expected_output_type)
    case expected_output_type
    when "string"
      expected_output_value.strip == parsed_actual
    when "float","integer"
      expected_output_value.to_f == parsed_actual
    when "array"
      expected_output_value == parsed_actual
    else
      false
    end
  end
end
