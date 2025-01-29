class CodeTestRunner
  PISTON_API_URL = 'https://emkc.org/api/v2/piston/execute'
  
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
        passed: compare_output(test_case.expected_output, actual_output),
        expected_output: test_case.expected_output,
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
  
  class PistonClient
    def self.call(input:, content:)
      normalized_code = content.gsub("\r\n", "\n")
      execution_line = %Q[\nputs solve(ARGV[0])]
      
      final_code = normalized_code + execution_line
      payload = {
        language: "ruby",
        version: "3.0.1",
        files: [
          {
            name: "solution.rb",
            content: final_code
          }
        ],
        stdin: @content,
        args: [input],
        compile_timeout: 10000,
        run_timeout: 3000,
        compile_memory_limit: -1,
        run_memory_limit: -1
      }
        
      response = HTTParty.post(PISTON_API_URL,
      headers: {
        'Content-Type' => 'application/json'
      },
        body: payload.to_json
      )

      response
    end
  end
end
   