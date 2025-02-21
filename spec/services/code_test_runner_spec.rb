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

    it 'handles stderr messages' do
      allow(PistonClient).to receive(:call).and_return(
        double(body: JSON.generate({
          "run" => {
            "output" => "",
            "stderr" => "Error message"
          }
        }))
      )
      results = runner.generate_result_hash.first
      expect(results[:stderr]).to eq("Error message")
    end
  end

  describe '#compare_output' do
    context 'when comparing strings' do
      it 'handles whitespace variations' do
        examples = {
          [ "Hello", "Hello" ] => true,
          [ "Hello ", " Hello" ] => true,
          [ "Hello\n", "Hello" ] => true,
          [ "Hello\r\n", "Hello" ] => true,
          # ["Hello  World", "Hello World"] => true,
          [ "Hello", "World" ] => false
        }

        examples.each do |inputs, expected|
          expect(runner.compare_output('string', inputs[0], inputs[1])).to eq(expected)
        end
      end

      it 'is case sensitive' do
        expect(runner.compare_output('string', 'hello', 'Hello')).to be false
      end
    end

    context 'when comparing numbers' do
      it 'handles different numeric representations' do
        examples = {
          [ "1.0", "1" ] => true,
          [ "1.00", "1.0" ] => true,
          [ " 42", "42.0 " ] => true,
          [ "3.14159", "3.14159000" ] => true,
          [ "1", "2" ] => false,
          [ "1.1", "1.2" ] => false
        }

        examples.each do |inputs, expected|
          expect(runner.compare_output('float', inputs[0], inputs[1])).to eq(expected)
        end
      end
    end

    context 'when comparing arrays' do
      it 'handles basic arrays' do
        examples = {
          [ [ 1, 2, 3 ], '[1, 2, 3]' ] => true,
          # [[1,2,3], '[3,2,1]'] => false,
          # # [["a","b"], '["a", "b"]'] => true,
          # [[1,2], '[1,2,3]'] => false
        }

        examples.each do |inputs, expected|
          # binding.pry
          puts " inputs[0] #{inputs[0].inspect}"
          puts " inputs[1] #{inputs[1]}"
          expect(runner.compare_output('array', inputs[0], inputs[1])).to eq(expected)
        end
      end

      # it 'handles nested arrays' do
      #   expect(runner.compare_output('array', '[[1,2],[3,4]]', '[[1, 2], [3, 4]]')).to be true
      #   expect(runner.compare_output('array', '[[1,2],[3,4]]', '[[3, 4], [1, 2]]')).to be true
      # end

      # it 'handles malformed JSON gracefully' do
      #   expect(runner.compare_output('array', '[1,2,3]', 'not json')).to be false
      #   expect(runner.compare_output('array', 'not json', '[1,2,3]')).to be false
      # end
    end
  end
end
