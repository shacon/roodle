class PistonClient
  PISTON_API_URL = "https://emkc.org/api/v2/piston/execute"

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
