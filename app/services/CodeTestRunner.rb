class CodeTestRunner
  PISTON_API_URL = 'https://emkc.org/api/v2/piston/execute'
  
  def initialize(content, prompt_id)
    @prompt = Prompt.find(prompt_id)
    @content = content
  end

  def generate_result_hash
    # for each test case, run content against test input
    results = []
    @prompt.test_suite.test_cases.each do |test_case|
      actual_output = PistonClient.call(input: test_case.prepared_input, content: @content)
      
      result = {
        passed: compare_output(test_case.expected_output, actual_output), expected_output: test_case.expected_output, actual_output: actual_output
      }
      
      results << result
    end
    
    results
  end
  
  def compare_output(expected, actual)
    expected == actual
  end
  
  class PistonClient
    def self.call(input:, content:)
      puts "CONTENT: #{content}"
      normalized_code = content.gsub("\r\n", "\n")
      # execution_line = %Q{\nputs solve(#{test_case_input.inspect})}

      input = "cat"
      input2 = "dog"
      execution_line = %Q[\nputs solve(ARGV[0])]
      other_execution_line = %Q[\nputs solve(ARGV[1])]
      
      final_code = normalized_code + execution_line + other_execution_line
      puts "final code: #{final_code}"
      puts "&&&&&&"
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
        args: [input, input2],
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

      puts response["run"]["stderr"]
      puts "*****"
      response
    end
  end
end
   

    
#     payload = {
#       language: "ruby",
#       version: "3.0.1",  # You can adjust the Ruby version as needed
#       files: [
#         {
#           name: "solution.rb",
#           content: "def "
#         }
#       ],
#       stdin: @content,
#       args: [],
#       compile_timeout: 10000,
#       run_timeout: 3000,
#       compile_memory_limit: -1,
#       run_memory_limit: -1    }
#     response = HTTParty.post(PISTON_API_URL,
#     headers: {
#       'Content-Type' => 'application/json'
#     },
#       body: your_request_body.to_json
#     )

#     puts response.body
#     puts response.code
#     puts response.message
#     puts response.headers.inspect

#     results = []
#     @prompt.test_suite.test_cases.each do |test_case|
#       result = {
#         passed: run_test(test_case)
#       }
#     end    
#   end

#   def run_test(test_case)
#    @content
#   #  take the content, hit the piston api with args as test_case input
#   payload = {
#     language: "ruby",
#     version: "3.0.1",  # You can adjust the Ruby version as needed
#     files: [
#       {
#         name: "solution.rb",
#         content: "def "
#       }
#     ],
#     stdin: @content,
#     args: [],
#     compile_timeout: 10000,
#     run_timeout: 3000,
#     compile_memory_limit: -1,
#     run_memory_limit: -1    }
#   response = HTTParty.post(PISTON_API_URL,
#   headers: {
#     'Content-Type' => 'application/json'
#   },
#     body: your_request_body.to_json
#   )
#   end
# end

# content = "def hi puts 'hi' end"
# ts = prompt.test_suite
# ts.test_cases.create(input:"[-2,1,-3,4,-1,2,1,-5,4]", expected_output: "6")
# ts.test_cases.create(input: "[-1,-2,-3,-4,-5]", expected_output: "-1")