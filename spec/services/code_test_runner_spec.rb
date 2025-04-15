require 'rails_helper'

RSpec.describe CodeTestRunner do
  let(:prompt) { create(:prompt) }
  let(:content) { "puts 'Hello, World!'" }
  let(:runner) { CodeTestRunner.new(content, prompt.id) }

  describe '#generate_result_hash' do
    before do
      mock_response = {
        "run" => {
          "output" => "Hello, World!\n",
          "stderr" => ""
        }
      }
      response_double = double(
        body: JSON.generate(mock_response),
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
      expect(results[:actual_output]).to eq("")
    end

    it 'correctly parses array from response string format' do
      array_response = "1\n2\n3\nArray\n"
      result = runner.convert_response_to_type(array_response)
      expect(result).to be_an(Array)
      expect(result).to eq([ 1, 2, 3 ])
    end

    it 'correctly parses hash from response string format' do
      hash_response = "{\"a\"=>{\"b\"=>{\"c\"=>1}}, \"d\"=>[1, 2, 3]}\nHash\n"
      result = runner.convert_response_to_type(hash_response)
      expect(result).to be_a(Hash)
      expect(result).to eq({ "a"=>{ "b"=>{ "c"=>1 } }, "d"=>[ 1, 2, 3 ] })
    end

    it 'correctly parses integer from response string format' do
      int_response = "45\nInteger\n"
      result = runner.convert_response_to_type(int_response)
      expect(result).to be_an(Integer)
      expect(result).to eq(45)
    end

     it 'correctly parses boolean from response string format' do
      bool_response = "false\nFalseClass\n"
      result = runner.convert_response_to_type(bool_response)
      expect(result).to be_a(FalseClass)
      expect(result).to eq(false)
    end
  end
end
