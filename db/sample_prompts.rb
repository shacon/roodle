# For Manual Testing
# Input: Array of integers
# Output: Array of Integers
prompt = Prompt.create(
  title: "Find Duplicates",
  content: "Write a function solve that takes in an array of integers and returns an array containing all the elements that appear more than once in the input array, in the order they first appear.",
  example: "Input: [1, 3, 4, 2, 2, 4] Expected Output: [2, 4]",
  display_date: Date.current
)

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases = [
  { input_type: 'array', input_value: [ 1, 3, 4, 2, 2, 4 ], expected_output_type: 'array', expected_output_value: [ 2, 4 ] },
  { input_type: 'array', input_value: [ 1, 1, 1, 1 ], expected_output_type: 'array', expected_output_value: [ 1 ] },
  { input_type: 'array', input_value: [ 1, 2, 3, 4 ], expected_output_type: 'array', expected_output_value: [] },
  { input_type: 'array', input_value: [], expected_output_type: 'array', expected_output_value: [] },
  { input_type: 'array', input_value: [ 5, 5, 2, 2, 1, 1 ], expected_output_type: 'array', expected_output_value: [ 5, 2, 1 ] }
]

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end

  #########################################
  # test solution
  seen = {}
  duplicates = []

  input.each do |num|
    if seen[num]
      duplicates << num unless duplicates.include?(num)
    else
      seen[num] = true
    end
  end

  duplicates
#######################################

# Integer input/output
prompt = Prompt.create(
 title: "Sum Digits",
 content: "Write a function solve that sums all digits in a number.",
 example: "Input: 123 Expected Output: 6",
 display_date: Date.current
)
prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases = [
 { input_type: 'integer', input_value: 123, expected_output_type: 'integer', expected_output_value: 6 },
 { input_type: 'integer', input_value: 0, expected_output_type: 'integer', expected_output_value: 0 },
 { input_type: 'integer', input_value: 999, expected_output_type: 'integer', expected_output_value: 27 },
 { input_type: 'integer', input_value: 12345, expected_output_type: 'integer', expected_output_value: 15 },
 { input_type: 'integer', input_value: 9876, expected_output_type: 'integer', expected_output_value: 30 }
]

test_cases.each do |tc|
 ts.test_cases.create!(tc)
end


# Integer input/output
prompt = Prompt.create(
  title: "Sum Digits",
  content: "Write a function solve that sums all digits in a number.",
  example: "Input: 123 Expected Output: 6",
  display_date: Date.current
)
prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases = [
  { input_type: 'integer', input_value: 123, expected_output_type: 'integer', expected_output_value: 6 },
  { input_type: 'integer', input_value: 0, expected_output_type: 'integer', expected_output_value: 0 },
  { input_type: 'integer', input_value: 999, expected_output_type: 'integer', expected_output_value: 27 },
  { input_type: 'integer', input_value: 12345, expected_output_type: 'integer', expected_output_value: 15 },
  { input_type: 'integer', input_value: 9876, expected_output_type: 'integer', expected_output_value: 30 }
]

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end

# String input/output
prompt = Prompt.create(
  title: "Reverse String",
  content: "Write a function solve that reverses a string.",
  example: "Input: 'hello' Expected Output: 'olleh'",
  display_date: Date.current
)
prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases = [
  { input_type: 'string', input_value: 'hello', expected_output_type: 'string', expected_output_value: 'olleh' },
  { input_type: 'string', input_value: '', expected_output_type: 'string', expected_output_value: '' },
  { input_type: 'string', input_value: 'a', expected_output_type: 'string', expected_output_value: 'a' },
  { input_type: 'string', input_value: 'racecar', expected_output_type: 'string', expected_output_value: 'racecar' },
  { input_type: 'string', input_value: 'Hello, World!', expected_output_type: 'string', expected_output_value: '!dlroW ,olleH' }
]

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end

# String input, array output
prompt = Prompt.create(
  title: "String to Words",
  content: "Write a function solve that splits a string into words.",
  example: "Input: 'hello world' Expected Output: ['hello', 'world']",
  display_date: Date.current
)
prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases = [
  { input_type: 'string', input_value: 'hello world', expected_output_type: 'array', expected_output_value: [ 'hello', 'world' ] },
  { input_type: 'string', input_value: '', expected_output_type: 'array', expected_output_value: [] },
  { input_type: 'string', input_value: 'one', expected_output_type: 'array', expected_output_value: [ 'one' ] },
  { input_type: 'string', input_value: 'the quick brown fox', expected_output_type: 'array', expected_output_value: [ 'the', 'quick', 'brown', 'fox' ] },
  { input_type: 'string', input_value: 'a b c d e', expected_output_type: 'array', expected_output_value: [ 'a', 'b', 'c', 'd', 'e' ] }
]

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end

# Array input, string output
prompt = Prompt.create(
  title: "Join Array",
  content: "Write a function solve that joins array elements with commas.",
  example: "Input: ['a', 'b', 'c'] Expected Output: 'a,b,c'",
  display_date: Date.current
)
prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases = [
  { input_type: 'array', input_value: [ 'a', 'b', 'c' ], expected_output_type: 'string', expected_output_value: 'a,b,c' },
  { input_type: 'array', input_value: [], expected_output_type: 'string', expected_output_value: '' },
  { input_type: 'array', input_value: [ 1, 2, 3 ], expected_output_type: 'string', expected_output_value: '1,2,3' },
  { input_type: 'array', input_value: [ 'hello' ], expected_output_type: 'string', expected_output_value: 'hello' },
  { input_type: 'array', input_value: [ true, false, 'maybe' ], expected_output_type: 'string', expected_output_value: 'true,false,maybe' }
]

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end

# Hash input, array output
prompt = Prompt.create(
  title: "Flatten Object",
  content: "Write a function solve that flattens a nested object into an array of values.",
  example: "Input: {'a': 1, 'b': {'c': 2}} Expected Output: [1, 2]",
  display_date: Date.current
)
prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases = [
  { input_type: 'hash', input_value: { 'a' => 1, 'b' => { 'c' => 2 } }, expected_output_type: 'array', expected_output_value: [ 1, 2 ] },
  { input_type: 'hash', input_value: {}, expected_output_type: 'array', expected_output_value: [] },
  { input_type: 'hash', input_value: { 'x' => [ 1, 2 ], 'y' => 3 }, expected_output_type: 'array', expected_output_value: [ 1, 2, 3 ] },
  { input_type: 'hash', input_value: { 'a' => { 'b' => { 'c' => 3 } } }, expected_output_type: 'array', expected_output_value: [ 3 ] },
  { input_type: 'hash', input_value: { 'a' => 1, 'b' => 2, 'c' => 3 }, expected_output_type: 'array', expected_output_value: [ 1, 2, 3 ] }
]

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end

# A solve for the above to test
def solve(input)
  result = []

  input.each_value do |value|
    if value.is_a?(Hash)
      result += solve(value)
    elsif value.is_a?(Array)
      result += value
    else
      result << value
    end
  end

  result
end
