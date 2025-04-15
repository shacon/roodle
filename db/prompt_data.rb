
starting_display_date = Prompt.last.display_date + 1.day
prompt = Prompt.create(
  title: "Repeat even numbers",
  content: "Given an array of numbers, replace each even number with two of the same number. Assume that the array has enough space to accommodate the result.",
  example: "Input: [1,2,5,6,8, nil, nil, nil] Expected Output: [1,2,2,5,6,6,8,8]",
  display_date: starting_display_date
)

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases = [
  { input_type: 'array', input_value: [1, 2, 3, 4, nil, nil, nil, nil], expected_output_type: 'array', expected_output_value: [1, 2, 2, 3, 4, 4, nil, nil] },
  { input_type: 'array', input_value: [2, 4, 6, nil, nil, nil], expected_output_type: 'array', expected_output_value: [2, 2, 4, 4, 6, 6] },
  { input_type: 'array', input_value: [1], expected_output_type: 'array', expected_output_value: [1] },
  { input_type: 'array', input_value: [8, nil, nil], expected_output_type: 'array', expected_output_value: [8, 8, nil] },
  { input_type: 'array', input_value: [7, 8, 9, 10, nil, nil, nil], expected_output_type: 'array', expected_output_value: [7, 8, 8, 9, 10, 10, nil] }
]

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end


display_date = starting_display_date + 1.day
# 2
prompt = Prompt.create(
  title: "Reverse a string",
  content: "Given a sentence, reverse the words of the sentence.",
  example: "Input: 'i live in a house' Expected Output: 'house a in live i'",
  display_date: display_date
)

test_cases = [
  { input_type: 'string', input_value: 'hello world', expected_output_type: 'string', expected_output_value: 'world hello' },
  { input_type: 'string', input_value: 'the quick brown fox', expected_output_type: 'string', expected_output_value: 'fox brown quick the' },
  { input_type: 'string', input_value: 'a', expected_output_type: 'string', expected_output_value: 'a' },
  { input_type: 'string', input_value: '', expected_output_type: 'string', expected_output_value: '' },
  { input_type: 'string', input_value: 'coding is fun and challenging', expected_output_type: 'string', expected_output_value: 'challenging and fun is coding' }
]

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end

# 3
display_date = display_date + 1.day
prompt = Prompt.create(
  title: "Reverse an array",
  content: "Given an array, reverse the order of its elements. For a more interesting challenge, try not to use Ruby's built in reverse method",
  example: "Input: [1, 2, 3, 4, 5, 6] Expected Output: [6, 5, 4, 3, 2, 1]",
  display_date: display_date
)

test_cases = [
  { input_type: 'array', input_value: [1, 2, 3, 4, 5], expected_output_type: 'array', expected_output_value: [5, 4, 3, 2, 1] },
  { input_type: 'array', input_value: [10, 20, 30], expected_output_type: 'array', expected_output_value: [30, 20, 10] },
  { input_type: 'array', input_value: [7], expected_output_type: 'array', expected_output_value: [7] },
  { input_type: 'array', input_value: [], expected_output_type: 'array', expected_output_value: [] },
  { input_type: 'array', input_value: [42, 17, 9, 36, 8, 2, 94], expected_output_type: 'array', expected_output_value: [94, 2, 8, 36, 9, 17, 42] }
]


prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end

# 4
display_date = display_date + 1.day
prompt = Prompt.create(
  title: "Two Sum",
  content: "Given a sorted array and a target value X, find 2 numbers in the array that sum to X. Return the indices of the two numbers.",
  example: "Input: [1, 2, 3, 4, 5], X = 9 Expected Output: [3, 4] (because 4 + 5 = 9)",
  display_date: display_date
)

test_cases = [
  { input_type: 'array', input_value: [[1, 2, 3, 4, 5], 9], expected_output_type: 'array', expected_output_value: [3, 4] },
  { input_type: 'array', input_value: [[2, 7, 11, 15], 9], expected_output_type: 'array', expected_output_value: [0, 1] },
  { input_type: 'array', input_value: [[1, 3, 4, 5, 7, 10, 11], 11], expected_output_type: 'array', expected_output_value: [0, 5] },
  { input_type: 'array', input_value: [[-3, -1, 0, 2, 6], 3], expected_output_type: 'array', expected_output_value: [1, 4] },
  { input_type: 'array', input_value: [[1, 2, 3, 4], 8], expected_output_type: 'array', expected_output_value: [2, 3] }
]

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end

#5
display_date = display_date + 1.day
prompt = Prompt.create(
  title: "Sorted Squares",
  content: "Given a sorted array in non-decreasing order, return an array of squares of each number, also in non-decreasing order. Try to solve it in O(n) time.",
  example: "Input: [-4, -2, -1, 0, 3, 5] Expected Output: [0, 1, 4, 9, 16, 25]",
  display_date: display_date
)

test_cases = [
  { input_type: 'array', input_value: [-4, -2, -1, 0, 3, 5], expected_output_type: 'array', expected_output_value: [0, 1, 4, 9, 16, 25] },
  { input_type: 'array', input_value: [-7, -3, 2, 3, 11], expected_output_type: 'array', expected_output_value: [4, 9, 9, 49, 121] },
  { input_type: 'array', input_value: [-5, -3, -2, -1], expected_output_type: 'array', expected_output_value: [1, 4, 9, 25] },
  { input_type: 'array', input_value: [0, 2, 4, 6, 8], expected_output_type: 'array', expected_output_value: [0, 4, 16, 36, 64] },
  { input_type: 'array', input_value: [-10, -5, 0, 5, 10], expected_output_type: 'array', expected_output_value: [0, 25, 25, 100, 100] }
]

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end

# 6
display_date = display_date + 1.day
prompt = Prompt.create(
  title: "Move Zeros to Beginning",
  content: "You are given an array of integers. Rearrange the array so that all zeroes are at the beginning of the array. The order of non-zero elements doesn't matter.",
  example: "Input: [4, 2, 0, 1, 0, 3, 0] Expected Output: [0, 0, 0, 4, 2, 1, 3] (or any arrangement where zeros are at the beginning)",
  display_date: display_date
)

test_cases = [
  { input_type: 'array', input_value: [4, 2, 0, 1, 0, 3, 0], expected_output_type: 'array', expected_output_value: [0, 0, 0, 4, 2, 1, 3] },
  { input_type: 'array', input_value: [1, 2, 3, 4, 5], expected_output_type: 'array', expected_output_value: [1, 2, 3, 4, 5] },
  { input_type: 'array', input_value: [0, 0, 0, 0], expected_output_type: 'array', expected_output_value: [0, 0, 0, 0] },
  { input_type: 'array', input_value: [0, 1, 0, 2, 0, 3], expected_output_type: 'array', expected_output_value: [0, 0, 0, 1, 2, 3] },
  { input_type: 'array', input_value: [9, 8, 7, 0, 6, 5, 0], expected_output_type: 'array', expected_output_value: [0, 0, 9, 8, 7, 6, 5] }
]

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end

#7
display_date = display_date + 1.day
prompt = Prompt.create(
  title: "Arrange Around Pivot",
  content: "Given an array of integers A and a pivot value, rearrange A in the following order: [Elements less than pivot, elements equal to pivot, elements greater than pivot]",
  example: "Input: [5, 2, 4, 4, 6, 4, 4, 3], pivot = 4 Expected Output: [2, 3, 4, 4, 4, 4, 5, 6]",
  display_date: display_date
)

test_cases = [
  { input_type: 'array', input_value: [[5, 2, 4, 4, 6, 4, 4, 3], 4], expected_output_type: 'array', expected_output_value: [2, 3, 4, 4, 4, 4, 5, 6] },
  { input_type: 'array', input_value: [[9, 12, 5, 10, 14, 3, 10], 10], expected_output_type: 'array', expected_output_value: [9, 5, 3, 10, 10, 12, 14] },
  { input_type: 'array', input_value: [[1, 2, 3, 4, 5], 3], expected_output_type: 'array', expected_output_value: [1, 2, 3, 4, 5] },
  { input_type: 'array', input_value: [[7, 7, 7, 7], 7], expected_output_type: 'array', expected_output_value: [7, 7, 7, 7] },
  { input_type: 'array', input_value: [[10, 8, 6, 4, 2], 5], expected_output_type: 'array', expected_output_value: [4, 2, 6, 8, 10] }
]

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end

# 8
display_date = display_date + 1.day
prompt = Prompt.create(
  title: "Dutch National Flag",
  content: "Given an array with n marbles colored Red (0), White (1) or Blue (2), sort them so that marbles of the same color are adjacent, with the colors in the order Red, White and Blue.",
  example: "Input: [1, 0, 1, 2, 1, 0, 1, 2] Expected Output: [0, 0, 1, 1, 1, 1, 2, 2]",
  display_date: display_date
)

test_cases = [
  { input_type: 'array', input_value: [1, 0, 1, 2, 1, 0, 1, 2], expected_output_type: 'array', expected_output_value: [0, 0, 1, 1, 1, 1, 2, 2] },
  { input_type: 'array', input_value: [2, 0, 1, 0, 1, 2], expected_output_type: 'array', expected_output_value: [0, 0, 1, 1, 2, 2] },
  { input_type: 'array', input_value: [0, 0, 0, 0], expected_output_type: 'array', expected_output_value: [0, 0, 0, 0] },
  { input_type: 'array', input_value: [2, 1, 0], expected_output_type: 'array', expected_output_value: [0, 1, 2] },
  { input_type: 'array', input_value: [1, 2, 0, 2, 1, 0], expected_output_type: 'array', expected_output_value: [0, 0, 1, 1, 2, 2] }
]

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end

# 9

display_date = display_date + 1.day
prompt = Prompt.create(
  title: "Maximum Subarray",
  content: "Given an array of integers, find the contiguous subarray (with at least 1 element) with the maximum sum. Return the start and end indices of this subarray. The array can contain both negative and positive integers.",
  example: "Input: [1, 2, -1, 2, -3, 2, -5] Expected Output: [0, 3] (because the subarray [1, 2, -1, 2] has the largest sum of 4)",
  display_date: display_date
)

test_cases = [
  { input_type: 'array', input_value: [1, 2, -1, 2, -3, 2, -5], expected_output_type: 'array', expected_output_value: [0, 3] },
  { input_type: 'array', input_value: [-2, 1, -3, 4, -1, 2, 1, -5, 4], expected_output_type: 'array', expected_output_value: [3, 6] },
  { input_type: 'array', input_value: [5, 4, -1, 7, 8], expected_output_type: 'array', expected_output_value: [0, 4] },
  { input_type: 'array', input_value: [-1, -2, -3, -4], expected_output_type: 'array', expected_output_value: [0, 0] },
  { input_type: 'array', input_value: [2, -5, 1, 3, -2, 4, -1], expected_output_type: 'array', expected_output_value: [2, 5] }
]

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end

# 10
display_date = display_date + 1.day
prompt = Prompt.create(
  title: "Subarray Sum",
  content: "Given an array of positive integers, find the contiguous subarray that sums to a given number X. Return the subarray itself.",
  example: "Input: [1, 2, 3, 5, 2], X = 8 Expected Output: [3, 5] (because 3 + 5 = 8)",
  display_date: display_date
)

test_cases = [
  { input_type: 'array', input_value: [[1, 2, 3, 5, 2], 8], expected_output_type: 'array', expected_output_value: [3, 5] },
  { input_type: 'array', input_value: [[1, 4, 20, 3, 10, 5], 33], expected_output_type: 'array', expected_output_value: [20, 3, 10] },
  { input_type: 'array', input_value: [[1, 2, 3, 4, 5], 9], expected_output_type: 'array', expected_output_value: [2, 3, 4] },
  { input_type: 'array', input_value: [[5, 10, 15, 20, 25], 45], expected_output_type: 'array', expected_output_value: [10, 15, 20] },
  { input_type: 'array', input_value: [[2, 4, 6, 8], 8], expected_output_type: 'array', expected_output_value: [8] }
]

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end

# 11
display_date = display_date + 1.day
prompt = Prompt.create(
  title: "Longest Unique Substring",
  content: "Given a string, find the longest substring with unique characters. Return the substring.",
  example: "Input: 'whatwhywhere' Expected Output: 'atwhy' (the longest substring with no repeating characters)",
  display_date: display_date
)

test_cases = [
  { input_type: 'string', input_value: 'whatwhywhere', expected_output_type: 'string', expected_output_value: 'atwhy' },
  { input_type: 'string', input_value: 'abcabcbb', expected_output_type: 'string', expected_output_value: 'abc' },
  { input_type: 'string', input_value: 'bbbbb', expected_output_type: 'string', expected_output_value: 'b' },
  { input_type: 'string', input_value: 'pwwkew', expected_output_type: 'string', expected_output_value: 'wke' },
  { input_type: 'string', input_value: 'aabcdefghi', expected_output_type: 'string', expected_output_value: 'abcdefghi' }
]

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end

# 12

display_date = display_date + 1.day
prompt = Prompt.create(
  title: "Zero Sum Subarray",
  content: "Given an array of integers, find the contiguous subarray that sums to 0. The array can contain both negative and positive integers. Return the subarray itself.",
  example: "Input: [2, 4, -2, 1, -3, 5, -3] Expected Output: [4, -2, 1, -3] (because 4 + (-2) + 1 + (-3) = 0)",
  display_date: display_date
)

test_cases = [
  { input_type: 'array', input_value: [2, 4, -2, 1, -3, 5, -3], expected_output_type: 'array', expected_output_value: [4, -2, 1, -3] },
  { input_type: 'array', input_value: [3, 4, -7, 3, 1, 3, 1, -4, -2, -2], expected_output_type: 'array', expected_output_value: [3, 4, -7] },
  { input_type: 'array', input_value: [1, 2, 3, -6, 4, 5], expected_output_type: 'array', expected_output_value: [1, 2, 3, -6] },
  { input_type: 'array', input_value: [4, 2, -3, 1, 6], expected_output_type: 'array', expected_output_value: [-3, 1, 2] },
  { input_type: 'array', input_value: [0, 1, 2, 3], expected_output_type: 'array', expected_output_value: [0] }
]

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end

# 13

display_date = display_date + 1.day
prompt = Prompt.create(
  title: "Target Sum Subarray",
  content: "Given an array of positive and negative integers, find a subarray whose sum equals X. Return the subarray itself.",
  example: "Input: [2, 4, -2, 1, -3, 5, -3], X = 5 Expected Output: [2, 4, -2, 1] (because 2 + 4 + (-2) + 1 = 5)",
  display_date: display_date
)

test_cases = [
  { input_type: 'array', input_value: [[2, 4, -2, 1, -3, 5, -3], 5], expected_output_type: 'array', expected_output_value: [2, 4, -2, 1] },
  { input_type: 'array', input_value: [[10, 2, -2, -20, 10], -10], expected_output_type: 'array', expected_output_value: [2, -2, -20, 10] },
  { input_type: 'array', input_value: [[1, 4, 20, 3, 10, 5], 33], expected_output_type: 'array', expected_output_value: [20, 3, 10] },
  { input_type: 'array', input_value: [[-10, 0, 2, -2, 15, 20], 5], expected_output_type: 'array', expected_output_value: [0, 2, -2, 5] },
  { input_type: 'array', input_value: [[1, 2, 3, 4, 5], 9], expected_output_type: 'array', expected_output_value: [2, 3, 4] }
]

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end

# 14

display_date = display_date + 1.day
prompt = Prompt.create(
  title: "Binary Search",
  content: "Given a sorted array, search for a target item. Return the index of the target if found, otherwise return -1.",
  example: "Input: [1, 2, 3, 4, 5, 6], target = 4 Expected Output: 3 (index of target 4)",
  display_date: display_date
)

test_cases = [
  { input_type: 'array', input_value: [[1, 2, 3, 4, 5, 6], 4], expected_output_type: 'integer', expected_output_value: 3 },
  { input_type: 'array', input_value: [[1, 3, 5, 7, 9, 11], 5], expected_output_type: 'integer', expected_output_value: 2 },
  { input_type: 'array', input_value: [[2, 4, 6, 8, 10, 12, 14], 1], expected_output_type: 'integer', expected_output_value: -1 },
  { input_type: 'array', input_value: [[1, 1, 2, 3, 5, 8, 13], 8], expected_output_type: 'integer', expected_output_value: 5 },
  { input_type: 'array', input_value: [[], 5], expected_output_type: 'integer', expected_output_value: -1 }
]

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end

# 15

display_date = display_date + 1.day
prompt = Prompt.create(
  title: "Closest Number",
  content: "Given a sorted array A and a target T, find the target. If the target is not in the array, find the index of the number closest to the target.",
  example: "Input: [2, 3, 5, 8, 9, 11], T = 7 Expected Output: 3 (index of 8, which is closest to 7)",
  display_date: display_date
)

test_cases = [
  { input_type: 'array', input_value: [[2, 3, 5, 8, 9, 11], 7], expected_output_type: 'integer', expected_output_value: 3 },
  { input_type: 'array', input_value: [[1, 3, 5, 7, 9], 4], expected_output_type: 'integer', expected_output_value: 1 },
  { input_type: 'array', input_value: [[10, 20, 30, 40, 50], 25], expected_output_type: 'integer', expected_output_value: 1 },
  { input_type: 'array', input_value: [[1, 2, 3, 4, 5], 5], expected_output_type: 'integer', expected_output_value: 4 },
  { input_type: 'array', input_value: [[1, 10, 20, 30, 40], 15], expected_output_type: 'integer', expected_output_value: 1 }
]

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end

# 16

display_date = display_date + 1.day
prompt = Prompt.create(
  title: "Find Minimum in Rotated Array",
  content: "Given a sorted array that has been rotated in a cycle, find the smallest element of the array in O(log(n)) time.",
  example: "Input: [5, 7, 8, 1, 2, 4] (originally [1, 2, 4, 5, 7, 8] rotated by 3) Expected Output: 3 (index of 1, which is the smallest element)",
  display_date: display_date
)

test_cases = [
  { input_type: 'array', input_value: [5, 7, 8, 1, 2, 4], expected_output_type: 'integer', expected_output_value: 3 },
  { input_type: 'array', input_value: [8, 1, 2, 4, 5, 7], expected_output_type: 'integer', expected_output_value: 1 },
  { input_type: 'array', input_value: [1, 2, 3, 4, 5], expected_output_type: 'integer', expected_output_value: 0 },
  { input_type: 'array', input_value: [4, 5, 6, 7, 0, 1, 2], expected_output_type: 'integer', expected_output_value: 4 },
  { input_type: 'array', input_value: [11, 13, 15, 17, 3, 5, 7, 9], expected_output_type: 'integer', expected_output_value: 4 }
]

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end

# 17

display_date = display_date + 1.day
prompt = Prompt.create(
  title: "Unbounded Binary Search",
  content: "Given a sorted array whose length is not known, perform binary search for a target T. Try to do the search in O(log(n)) time.",
  example: "Input: [2, 3, 5, 8, 9, 11, ...], T = 9 Expected Output: 4 (index of target 9)",
  display_date: display_date
)

test_cases = [
  { input_type: 'array', input_value: [[2, 3, 5, 8, 9, 11, 13, 17, 19, 23], 9], expected_output_type: 'integer', expected_output_value: 4 },
  { input_type: 'array', input_value: [[1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 7], expected_output_type: 'integer', expected_output_value: 6 },
  { input_type: 'array', input_value: [[10, 20, 30, 40, 50, 60, 70, 80, 90], 25], expected_output_type: 'integer', expected_output_value: -1 },
  { input_type: 'array', input_value: [[5, 10, 15, 20, 25, 30, 35, 40], 5], expected_output_type: 'integer', expected_output_value: 0 },
  { input_type: 'array', input_value: [[1, 3, 5, 7, 9, 11, 13, 15], 15], expected_output_type: 'integer', expected_output_value: 7 }
]

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end

# 18
display_date = display_date + 1.day
prompt = Prompt.create(
  title: "Fibonacci Number",
  content: "Find the Nth element of the Fibonacci series. The Fibonacci series starts with 1, 1 and each subsequent number is the sum of the two preceding ones: 1, 1, 2, 3, 5, 8, ...",
  example: "Input: 6 Expected Output: 8 (the 6th Fibonacci number)",
  display_date: display_date
)

test_cases = [
  { input_type: 'integer', input_value: 6, expected_output_type: 'integer', expected_output_value: 8 },
  { input_type: 'integer', input_value: 1, expected_output_type: 'integer', expected_output_value: 1 },
  { input_type: 'integer', input_value: 10, expected_output_type: 'integer', expected_output_value: 55 },
  { input_type: 'integer', input_value: 20, expected_output_type: 'integer', expected_output_value: 6765 },
  { input_type: 'integer', input_value: 15, expected_output_type: 'integer', expected_output_value: 610 }
]

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end

# 19

display_date = display_date + 1.day
prompt = Prompt.create(
  title: "Power Function",
  content: "Implement a function to calculate x^n (x raised to the power of n). Both x and n can be positive or negative. Try to implement this in O(log(n)) time.",
  example: "Input: x = 2, n = 10 Expected Output: 1024 (2^10 = 1024)",
  display_date: display_date
)

test_cases = [
  { input_type: 'array', input_value: [2, 10], expected_output_type: 'float', expected_output_value: 1024.0 },
  { input_type: 'array', input_value: [2, -2], expected_output_type: 'float', expected_output_value: 0.25 },
  { input_type: 'array', input_value: [3, 3], expected_output_type: 'float', expected_output_value: 27.0 },
  { input_type: 'array', input_value: [-2, 3], expected_output_type: 'float', expected_output_value: -8.0 },
  { input_type: 'array', input_value: [5, 0], expected_output_type: 'float', expected_output_value: 1.0 }
]

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end

# 20
display_date = display_date + 1.day
prompt = Prompt.create(
  title: "Phone Number Mnemonics",
  content: "Given an N digit phone number, print all the strings that can be made from that phone number. Since 1 and 0 don't correspond to any characters, ignore them. For reference: 2 (abc), 3 (def), 4 (ghi), 5 (jkl), 6 (mno), 7 (pqrs), 8 (tuv), 9 (wxyz)",
  example: "Input: '213' Expected Output: ['a1d', 'a1e', 'a1f', 'b1d', 'b1e', 'b1f', 'c1d', 'c1e', 'c1f']",
  display_date: display_date
)

test_cases = [
  { input_type: 'string', input_value: '213', expected_output_type: 'array', expected_output_value: ['a1d', 'a1e', 'a1f', 'b1d', 'b1e', 'b1f', 'c1d', 'c1e', 'c1f'] },
  { input_type: 'string', input_value: '23', expected_output_type: 'array', expected_output_value: ['ad', 'ae', 'af', 'bd', 'be', 'bf', 'cd', 'ce', 'cf'] },
  { input_type: 'string', input_value: '456', expected_output_type: 'array', expected_output_value: ['gjm', 'gjn', 'gjo', 'gkm', 'gkn', 'gko', 'glm', 'gln', 'glo', 'hjm', 'hjn', 'hjo', 'hkm', 'hkn', 'hko', 'hlm', 'hln', 'hlo', 'ijm', 'ijn', 'ijo', 'ikm', 'ikn', 'iko', 'ilm', 'iln', 'ilo'] },
  { input_type: 'string', input_value: '9', expected_output_type: 'array', expected_output_value: ['w', 'x', 'y', 'z'] },
  { input_type: 'string', input_value: '10', expected_output_type: 'array', expected_output_value: ['10'] }
]

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end

# 21
display_date = display_date + 1.day
prompt = Prompt.create(
  title: "Coin Change Combinations",
  content: "Given a set of coin denominations, print out the different ways you can make a target amount. You can use as many coins of each denomination as you like.",
  example: "Input: coins = [1, 2, 5], target = 5 Expected Output: [[1, 1, 1, 1, 1], [1, 1, 1, 2], [1, 2, 2], [5]]",
  display_date: display_date
)

test_cases = [
  { input_type: 'array', input_value: [[1, 2, 5], 5], expected_output_type: 'array', expected_output_value: [[1, 1, 1, 1, 1], [1, 1, 1, 2], [1, 2, 2], [5]] },
  { input_type: 'array', input_value: [[1, 2], 4], expected_output_type: 'array', expected_output_value: [[1, 1, 1, 1], [1, 1, 2], [2, 2]] },
  { input_type: 'array', input_value: [[2, 3, 5], 7], expected_output_type: 'array', expected_output_value: [[2, 2, 3], [2, 5]] },
  { input_type: 'array', input_value: [[1, 5, 10], 10], expected_output_type: 'array', expected_output_value: [[1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 5], [5, 5], [10]] },
  { input_type: 'array', input_value: [[2, 5], 3], expected_output_type: 'array', expected_output_value: [] }
]

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end

# 22
display_date = display_date + 1.day
prompt = Prompt.create(
  title: "Maze Path",
  content: "You are given a 2D array that represents a maze. It can have 2 values - 0 and 1. 1 represents a wall and 0 represents a path. The objective of the maze is to reach the bottom right corner from the top left corner. You can only go in 4 directions - up, down, left or right. Find if a path exists.",
  example: "Input: [[0, 0, 1], [1, 0, 0], [0, 0, 0]] Expected Output: true (a path exists from top-left to bottom-right)",
  display_date: display_date
)

test_cases = [
  { input_type: 'array', input_value: [[0, 0, 1], [1, 0, 0], [0, 0, 0]], expected_output_type: 'boolean', expected_output_value: true },
  { input_type: 'array', input_value: [[0, 1, 0], [0, 1, 0], [0, 0, 0]], expected_output_type: 'boolean', expected_output_value: true },
  { input_type: 'array', input_value: [[0, 0, 0], [1, 1, 1], [0, 0, 0]], expected_output_type: 'boolean', expected_output_value: false },
  { input_type: 'array', input_value: [[0, 1], [1, 0]], expected_output_type: 'boolean', expected_output_value: false },
  { input_type: 'array', input_value: [[0, 0, 0], [0, 1, 0], [0, 0, 0]], expected_output_type: 'boolean', expected_output_value: true }
]

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end


