class PistonClient
  PISTON_API_URL = "https://emkc.org/api/v2/piston/execute"


  def self.execution_line(input_type, expected_output_type)
    execution_line = %Q[\nrequire 'json'\nputs solve(JSON.parse(ARGV[0]))]
    # If the expected output is an array, we need to disambiguate from string and vice versa
    if expected_output_type == "array" || expected_output_type == "string"
      execution_line += ".inspect"
    end
    execution_line
  end

  def self.call(input:, input_type:, expected_output_type:, content:)
    normalized_code = content.gsub("\r\n", "\n")
    execution_line = execution_line(input_type, expected_output_type)
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
      args: [ input ],
      compile_timeout: 10000,
      run_timeout: 3000,
      compile_memory_limit: -1,
      run_memory_limit: -1
    }

    response = HTTParty.post(PISTON_API_URL,
    headers: {
      "Content-Type" => "application/json"
    },
      body: payload.to_json
    )
    response
  end


end
