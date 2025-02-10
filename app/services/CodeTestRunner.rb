class CodeTestRunner
  
  def initialize(content, prompt_id)
    @prompt = Prompt.find(prompt_id)
    @content = content
  end

  def generate_result_hash
    results = []
    @prompt.test_suite.test_cases.each do |test_case|
      response = PistonClient.call(input: test_case.prepared_input, content: @content)
      data = JSON.parse(response.body)
      actual_output = data["run"]["output"]
      
      result = {
        passed: compare_output(test_case.expected_output_value, actual_output),
        expected_output_value: test_case.expected_output_value,
        actual_output: actual_output,
        stderr: response["run"]["stderr"]
      }
      results << result
    end
    
    results
  end
  
  def compare_output(expected, actual)
    expected.strip == actual.strip
  end

  # def compare_output(expected_type, expected_value, actual)
  #   # expected_type will be stored on the testcase as expected_output_type
  #   case expected_type
  #   when 'string'
  #     expected_value.strip == actual.strip
  #   when 'number'
  #     expected_value.to_f == actual.to_f
  #   when 'array'
  #     # Maybe need to parse JSON if coming back as string
  #     # Maybe need to handle order/no order
  #   end
  # end
  
end