class CodeTestRunner
  
  def initialize(content, prompt_id)
    @prompt = Prompt.find(prompt_id)
    @content = content
  end

  def generate_result_hash
    results = []
    @prompt.test_suite.test_cases.each do |test_case|
      response = PistonClient.call(input: test_case.prepared_input, content: @content)
      puts "in the test runner the response is #{response.body}"
      parsed_response = JSON.parse(response.body)
      puts "response.body #{response.body}"
      actual_output = parsed_response["run"]["output"]
      puts "expect: #{test_case.expected_output_value}"
      puts "actual: #{actual_output}"
      puts "actual type: #{actual_output.class}"
      
      result = {
        passed: compare_output(test_case.input_type, test_case.expected_output_value, actual_output),
        expected_output_value: test_case.expected_output_value,
        actual_output: actual_output,
        stderr: parsed_response["run"]["stderr"]
      }
      results << result
    end
    
    results
  end

  def compare_output(expected_type, expected_value, actual)
    # binding.pry
    case expected_type
    when 'string'
      expected_value.strip == actual.strip
    when 'float' || 'integer'
      expected_value.to_f == actual.to_f
    when 'array'
      expected_value == actual.split.map(&:to_i)
    else
      false
    end
  end
  
end