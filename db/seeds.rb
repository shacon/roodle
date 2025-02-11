# prompt = Prompt.create(
#   title: "Reverse String",
#   content: "Write a function solve that takes in a string as input and returns the reverse of that string",
#   example: "Input: 'cat' Expected Output: 'tac' ",
#   display_date: Date.current
# )

# prompt.test_suite = TestSuite.create()
# ts = prompt.test_suite

# test_cases = [
#   { input_type: 'string', input_value: 'cat', expected_output_type: 'string', expected_output_value: 'tac' },
#   { input_type: 'string', input_value: 'emotion', expected_output_type: 'string', expected_output_value: 'noitome' },
#   { input_type: 'string', input_value: 'fix', expected_output_type: 'string', expected_output_value: 'xif' },
#   { input_type: 'string', input_value: '', expected_output_type: 'string', expected_output_value: '' },
#   { input_type: 'string', input_value: '123456789', expected_output_type: 'string', expected_output_value: '987654321' }
# ]

# test_cases.each do |tc|
#   ts.test_cases.create!(tc)
# end

prompt = Prompt.create(
  title: "Find Duplicates",
  content: "Write a function solve that takes in an array of integers and returns an array containing all the elements that appear more than once in the input array, in the order they first appear.",
  example: "Input: [1, 3, 4, 2, 2, 4] Expected Output: [2, 4]",
  display_date: Date.current
)

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases = [
  { input_type: 'array', input_value: [1, 3, 4, 2, 2, 4], expected_output_type: 'array', expected_output_value: [2, 4] },
  { input_type: 'array', input_value: [1, 1, 1, 1], expected_output_type: 'array', expected_output_value: [1] },
  { input_type: 'array', input_value: [1, 2, 3, 4], expected_output_type: 'array', expected_output_value: [] },
  { input_type: 'array', input_value: [], expected_output_type: 'array', expected_output_value: [] },
  { input_type: 'array', input_value: [5, 5, 2, 2, 1, 1], expected_output_type: 'array', expected_output_value: [5, 2, 1] }
]

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end