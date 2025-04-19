require 'rails_helper'

RSpec.describe CodeTestRunner do
  let(:prompt) { create(:prompt) }
  let(:content) { "puts 'Hello, World!'" }
  let(:runner) { CodeTestRunner.new(content, prompt.id) }

  describe '#generate_result_hash' do
    before do
      mock_response =  '{
        "language":"ruby",
        "version":"3.0.1",
        "run": {
          "stdout":
            "{\"test\":1,\"seting\":2,\"3\":\"ajsjkha\"}\n",
            "stderr": "",
            "code": 0,
            "signal": null,
            "output": "{\"test\":1,\"seting\":2,\"3\":\"ajsjkha\"}\n"}
          }'
      response_double = double(
        body: mock_response,
      )

      allow(PistonClient).to receive(:call).and_return(response_double)
    end

    it 'returns an array of results with correct structure' do
      results = runner.generate_result_hash

      expect(results).to be_an(Array)
      results.each do |result|
        expect(result).to include(:passed, :expected_output_value, :actual_output, :stderr)
      end
    end

    it 'handles empty output correctly' do
      allow(PistonClient).to receive(:call).and_return(
        double(body: JSON.generate({
          "run" => {
            "output" => "",
            "stderr" => ""
          }
        }))
      )
      results = runner.generate_result_hash.first
      puts "ACTUAL results here #{results}"
      expect(results[:actual_output]).to eq("")
      end
  end
end
