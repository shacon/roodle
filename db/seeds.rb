prompt = Prompt.create(
  title: "Flatten Object",
  content: "Write a function solve that flattens a nested object into an array of values.",
  example: "Input: {'a': 1, 'b': {'c': 2}} Expected Output: [1, 2]",
  display_date: Date.current
)
prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases = [
  { input_type: 'hash', input_value: {'a' => 1, 'b' => {'c' => 2}}, expected_output_type: 'array', expected_output_value: [1, 2] },
  { input_type: 'hash', input_value: {}, expected_output_type: 'array', expected_output_value: [] },
  { input_type: 'hash', input_value: {'x' => [1, 2], 'y' => 3}, expected_output_type: 'array', expected_output_value: [1, 2, 3] },
  { input_type: 'hash', input_value: {'a' => {'b' => {'c' => 3}}}, expected_output_type: 'array', expected_output_value: [3] },
  { input_type: 'hash', input_value: {'a' => 1, 'b' => 2, 'c' => 3}, expected_output_type: 'array', expected_output_value: [1, 2, 3] }
]

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end