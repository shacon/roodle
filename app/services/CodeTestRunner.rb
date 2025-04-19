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
      Rails.logger.info("Prepared input here: #{test_case.prepared_input}")
      Rails.logger.info("Piston client response: #{response}")
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
    Rails.logger.info("Response withing the convert: #{response}")
    unless response.empty?
      JSON.parse(response)
    end
    response
  end

  def compare_output(expected_output_value, actual_output_value)
    Rails.logger.info "Expected: #{PP.pp(expected_output_value, '')} - Actual: #{PP.pp(actual_output_value, '')}"
    if expected_output_value.is_a?(Hash) && actual_output_value.is_a?(Hash)
        expected_output_value.sort.to_h == actual_output_value.sort.to_h
    end
    expected_output_value == actual_output_value
  end
end
