
## Find Duplicates

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

## String Compression

prompt = Prompt.create(
  title: "String Compression",
  content: "Write a function solve that compresses a string by replacing consecutive repeated characters with the character followed by the count of repetitions. If the compressed string is not shorter than the original, return the original string.",
  example: "Input: 'aabcccccaaa' Expected Output: 'a2b1c5a3'",
  display_date: Date.current + 1.day
)

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases = [
  { input_type: 'string', input_value: 'aabcccccaaa', expected_output_type: 'string', expected_output_value: 'a2b1c5a3' },
  { input_type: 'string', input_value: 'abcd', expected_output_type: 'string', expected_output_value: 'abcd' },
  { input_type: 'string', input_value: 'aaaaaaaaaa', expected_output_type: 'string', expected_output_value: 'a10' },
  { input_type: 'string', input_value: '', expected_output_type: 'string', expected_output_value: '' },
  { input_type: 'string', input_value: 'aabbaa', expected_output_type: 'string', expected_output_value: 'a2b2a2' }
]

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end


## Balanced Parentheses

prompt = Prompt.create(
  title: "Balanced Parentheses",
  content: "Write a function solve that takes a string containing only the characters '(', ')', '{', '}', '[' and ']', and determines if the input string has balanced parentheses.",
  example: "Input: '(){}[]' Expected Output: true",
  display_date: Date.current + 2.days
)

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases = [
  { input_type: 'string', input_value: '(){}[]', expected_output_type: 'boolean', expected_output_value: true },
  { input_type: 'string', input_value: '([{}])', expected_output_type: 'boolean', expected_output_value: true },
  { input_type: 'string', input_value: '(]', expected_output_type: 'boolean', expected_output_value: false },
  { input_type: 'string', input_value: '([)]', expected_output_type: 'boolean', expected_output_value: false },
  { input_type: 'string', input_value: '{[]}()', expected_output_type: 'boolean', expected_output_value: true }
]

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end


## Palindrome Checker

prompt = Prompt.create(
  title: "Palindrome Checker",
  content: "Write a function solve that checks if a given string is a palindrome, considering only alphanumeric characters and ignoring case. Return true if it is a palindrome, false otherwise.",
  example: "Input: 'A man, a plan, a canal: Panama' Expected Output: true",
  display_date: Date.current + 3.days
)

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases = [
  { input_type: 'string', input_value: 'A man, a plan, a canal: Panama', expected_output_type: 'boolean', expected_output_value: true },
  { input_type: 'string', input_value: 'race a car', expected_output_type: 'boolean', expected_output_value: false },
  { input_type: 'string', input_value: '12321', expected_output_type: 'boolean', expected_output_value: true },
  { input_type: 'string', input_value: 'Able, was I ere I saw Elba', expected_output_type: 'boolean', expected_output_value: true },
  { input_type: 'string', input_value: '', expected_output_type: 'boolean', expected_output_value: true }
]

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end


## Merge Sorted Arrays

prompt = Prompt.create(
  title: "Merge Sorted Arrays",
  content: "Write a function solve that takes two sorted arrays of integers and merges them into a single sorted array.",
  example: "Input: [1, 3, 5], [2, 4, 6] Expected Output: [1, 2, 3, 4, 5, 6]",
  display_date: Date.current + 4.days
)

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases = [
  { input_type: 'array', input_value: [[1, 3, 5], [2, 4, 6]], expected_output_type: 'array', expected_output_value: [1, 2, 3, 4, 5, 6] },
  { input_type: 'array', input_value: [[1, 2, 3], [4, 5, 6]], expected_output_type: 'array', expected_output_value: [1, 2, 3, 4, 5, 6] },
  { input_type: 'array', input_value: [[], [1, 2, 3]], expected_output_type: 'array', expected_output_value: [1, 2, 3] },
  { input_type: 'array', input_value: [[1, 3, 5, 7], [2, 4]], expected_output_type: 'array', expected_output_value: [1, 2, 3, 4, 5, 7] },
  { input_type: 'array', input_value: [[1, 1, 3], [1, 2, 3]], expected_output_type: 'array', expected_output_value: [1, 1, 1, 2, 3, 3] }
]

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end
\

## Fibonacci Sequence

prompt = Prompt.create(
  title: "Fibonacci Sequence",
  content: "Write a function solve that takes an integer n and returns the nth Fibonacci number. The Fibonacci sequence starts with 0 and 1, and each subsequent number is the sum of the two preceding ones.",
  example: "Input: 6 Expected Output: 8 (The sequence is 0, 1, 1, 2, 3, 5, 8, ...)",
  display_date: Date.current + 5.days
)

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases = [
  { input_type: 'integer', input_value: 6, expected_output_type: 'integer', expected_output_value: 8 },
  { input_type: 'integer', input_value: 0, expected_output_type: 'integer', expected_output_value: 0 },
  { input_type: 'integer', input_value: 1, expected_output_type: 'integer', expected_output_value: 1 },
  { input_type: 'integer', input_value: 10, expected_output_type: 'integer', expected_output_value: 55 },
  { input_type: 'integer', input_value: 20, expected_output_type: 'integer', expected_output_value: 6765 }
]

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end


## Anagram Detector

prompt = Prompt.create(
  title: "Anagram Detector",
  content: "Write a function solve that takes two strings and determines if they are anagrams of each other. An anagram is a word formed by rearranging the letters of another word. Ignore case and non-alphanumeric characters.",
  example: "Input: 'Listen', 'Silent' Expected Output: true",
  display_date: Date.current + 6.days
)

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases = [
  { input_type: 'array', input_value: ['Listen', 'Silent'], expected_output_type: 'boolean', expected_output_value: true },
  { input_type: 'array', input_value: ['hello', 'world'], expected_output_type: 'boolean', expected_output_value: false },
  { input_type: 'array', input_value: ['Dormitory', 'Dirty Room'], expected_output_type: 'boolean', expected_output_value: true },
  { input_type: 'array', input_value: ['The Morse Code', 'Here come dots'], expected_output_type: 'boolean', expected_output_value: true },
  { input_type: 'array', input_value: ['', ''], expected_output_type: 'boolean', expected_output_value: true }
]

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end


## Deep Flatten Array

prompt = Prompt.create(
  title: "Deep Flatten Array",
  content: "Write a function solve that takes a nested array and returns a single-level flat array with all elements in the original order.",
  example: "Input: [1, [2, [3, 4], 5], 6] Expected Output: [1, 2, 3, 4, 5, 6]",
  display_date: Date.current + 7.days
)

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases = [
  { input_type: 'array', input_value: [1, [2, [3, 4], 5], 6], expected_output_type: 'array', expected_output_value: [1, 2, 3, 4, 5, 6] },
  { input_type: 'array', input_value: [1, 2, 3, 4], expected_output_type: 'array', expected_output_value: [1, 2, 3, 4] },
  { input_type: 'array', input_value: [[[[1]]], [2], [[3]]], expected_output_type: 'array', expected_output_value: [1, 2, 3] },
  { input_type: 'array', input_value: [], expected_output_type: 'array', expected_output_value: [] },
  { input_type: 'array', input_value: [[[], []], [], [[[][]]]], expected_output_type: 'array', expected_output_value: [] }
]

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end


##  Word Frequency Counter

prompt = Prompt.create(
  title: "Word Frequency Counter",
  content: "Write a function solve that takes a string and returns a hash mapping each word to its frequency. Words should be case-insensitive and separated by whitespace.",
  example: "Input: 'The quick brown fox jumps over the lazy dog.' Expected Output: {'the'=>2, 'quick'=>1, 'brown'=>1, 'fox'=>1, 'jumps'=>1, 'over'=>1, 'lazy'=>1, 'dog'=>1}",
  display_date: Date.current + 8.days
)

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases = [
  { input_type: 'string', input_value: 'The quick brown fox jumps over the lazy dog.', expected_output_type: 'hash', expected_output_value: {'the'=>2, 'quick'=>1, 'brown'=>1, 'fox'=>1, 'jumps'=>1, 'over'=>1, 'lazy'=>1, 'dog'=>1} },
  { input_type: 'string', input_value: 'apple apple orange banana apple banana', expected_output_type: 'hash', expected_output_value: {'apple'=>3, 'orange'=>1, 'banana'=>2} },
  { input_type: 'string', input_value: '', expected_output_type: 'hash', expected_output_value: {} },
  { input_type: 'string', input_value: 'Ruby Ruby Ruby', expected_output_type: 'hash', expected_output_value: {'ruby'=>3} },
  { input_type: 'string', input_value: 'The The the THE', expected_output_type: 'hash', expected_output_value: {'the'=>4} }
]

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end


## Missing Number

prompt = Prompt.create(
  title: "Missing Number",
  content: "Write a function solve that takes an array containing n distinct numbers taken from 0, 1, 2, ..., n, and returns the one number in the range that is missing from the array.",
  example: "Input: [3, 0, 1] Expected Output: 2",
  display_date: Date.current + 9.days
)

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases = [
  { input_type: 'array', input_value: [3, 0, 1], expected_output_type: 'integer', expected_output_value: 2 },
  { input_type: 'array', input_value: [9, 6, 4, 2, 3, 5, 7, 0, 1], expected_output_type: 'integer', expected_output_value: 8 },
  { input_type: 'array', input_value: [0], expected_output_type: 'integer', expected_output_value: 1 },
  { input_type: 'array', input_value: [1], expected_output_type: 'integer', expected_output_value: 0 },
  { input_type: 'array', input_value: [0, 1, 2, 3, 5], expected_output_type: 'integer', expected_output_value: 4 }
]

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end


##  Binary Search

prompt = Prompt.create(
  title: "Binary Search",
  content: "Write a function solve that implements binary search on a sorted array. The function should take a sorted array and a target value, and return the index of the target if it's present in the array, or -1 if it's not present.",
  example: "Input: [1, 2, 3, 4, 5], 3 Expected Output: 2",
  display_date: Date.current + 10.days
)

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases = [
  { input_type: 'array', input_value: [[1, 2, 3, 4, 5], 3], expected_output_type: 'integer', expected_output_value: 2 },
  { input_type: 'array', input_value: [[1, 2, 3, 4, 5], 6], expected_output_type: 'integer', expected_output_value: -1 },
  { input_type: 'array', input_value: [[1, 3, 5, 7, 9], 5], expected_output_type: 'integer', expected_output_value: 2 },
  { input_type: 'array', input_value: [[1, 3, 5, 7, 9, 11], 1], expected_output_type: 'integer', expected_output_value: 0 },
  { input_type: 'array', input_value: [[], 5], expected_output_type: 'integer', expected_output_value: -1 }
]

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end


## Group Anagrams

prompt = Prompt.create(
  title: "Group Anagrams",
  content: "Write a function solve that groups an array of strings based on whether they are anagrams of each other. Return an array of arrays, where each inner array contains a group of anagrams.",
  example: "Input: ['eat', 'tea', 'tan', 'ate', 'nat', 'bat'] Expected Output: [['eat', 'tea', 'ate'], ['tan', 'nat'], ['bat']]",
  display_date: Date.current + 11.days
)

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases = [
  { input_type: 'array', input_value: ['eat', 'tea', 'tan', 'ate', 'nat', 'bat'], expected_output_type: 'array', expected_output_value: [['eat', 'tea', 'ate'], ['tan', 'nat'], ['bat']] },
  { input_type: 'array', input_value: ['listen', 'silent', 'enlist'], expected_output_type: 'array', expected_output_value: [['listen', 'silent', 'enlist']] },
  { input_type: 'array', input_value: ['a'], expected_output_type: 'array', expected_output_value: [['a']] },
  { input_type: 'array', input_value: [], expected_output_type: 'array', expected_output_value: [] },
  { input_type: 'array', input_value: ['hello', 'world', 'ruby'], expected_output_type: 'array', expected_output_value: [['hello'], ['world'], ['ruby']] }
]

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end


##  Roman to Integer

prompt = Prompt.create(
  title: "Roman to Integer",
  content: "Write a function solve that converts a Roman numeral string to an integer. Roman numerals are represented by combinations of letters from the Latin alphabet (I=1, V=5, X=10, L=50, C=100, D=500, M=1000). Subtraction is used when a smaller numeral precedes a larger one (e.g., IV = 4).",
  example: "Input: 'XIV' Expected Output: 14",
  display_date: Date.current + 12.days
)

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases = [
  { input_type: 'string', input_value: 'XIV', expected_output_type: 'integer', expected_output_value: 14 },
  { input_type: 'string', input_value: 'MCMXCIV', expected_output_type: 'integer', expected_output_value: 1994 },
  { input_type: 'string', input_value: 'III', expected_output_type: 'integer', expected_output_value: 3 },
  { input_type: 'string', input_value: 'IX', expected_output_type: 'integer', expected_output_value: 9 },
  { input_type: 'string', input_value: 'LVIII', expected_output_type: 'integer', expected_output_value: 58 }
]

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end


## Longest Common Prefix

prompt = Prompt.create(
  title: "Longest Common Prefix",
  content: "Write a function solve that finds the longest common prefix among an array of strings. If there is no common prefix, return an empty string.",
  example: "Input: ['flower', 'flow', 'flight'] Expected Output: 'fl'",
  display_date: Date.current + 13.days
)

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases = [
  { input_type: 'array', input_value: ['flower', 'flow', 'flight'], expected_output_type: 'string', expected_output_value: 'fl' },
  { input_type: 'array', input_value: ['dog', 'racecar', 'car'], expected_output_type: 'string', expected_output_value: '' },
  { input_type: 'array', input_value: ['ruby', 'ruby', 'ruby'], expected_output_type: 'string', expected_output_value: 'ruby' },
  { input_type: 'array', input_value: [''], expected_output_type: 'string', expected_output_value: '' },
  { input_type: 'array', input_value: ['prefix', 'preface', 'preliminary', 'predict'], expected_output_type: 'string', expected_output_value: 'pre' }
]

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end


## Valid Sudoku

prompt = Prompt.create(
  title: "Valid Sudoku",
  content: "Write a function solve that determines if a partially filled 9x9 Sudoku board is valid. A valid Sudoku must have no repeated digits in any row, column, or 3x3 subgrid. Empty cells are indicated with a '.'.",
  example: "Input: [['5', '3', '.', '.', '7', '.', '.', '.', '.'], ['6', '.', '.', '1', '9', '5', '.', '.', '.'], ['.', '9', '8', '.', '.', '.', '.', '6', '.'], ['8', '.', '.', '.', '6', '.', '.', '.', '3'], ['4', '.', '.', '8', '.', '3', '.', '.', '1'], ['7', '.', '.', '.', '2', '.', '.', '.', '6'], ['.', '6', '.', '.', '.', '.', '2', '8', '.'], ['.', '.', '.', '4', '1', '9', '.', '.', '5'], ['.', '.', '.', '.', '8', '.', '.', '7', '9']] Expected Output: true",
  display_date: Date.current + 14.days
)

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases = [
  { input_type: 'array', input_value: [['5', '3', '.', '.', '7', '.', '.', '.', '.'], ['6', '.', '.', '1', '9', '5', '.', '.', '.'], ['.', '9', '8', '.', '.', '.', '.', '6', '.'], ['8', '.', '.', '.', '6', '.', '.', '.', '3'], ['4', '.', '.', '8', '.', '3', '.', '.', '1'], ['7', '.', '.', '.', '2', '.', '.', '.', '6'], ['.', '6', '.', '.', '.', '.', '2', '8', '.'], ['.', '.', '.', '4', '1', '9', '.', '.', '5'], ['.', '.', '.', '.', '8', '.', '.', '7', '9']], expected_output_type: 'boolean', expected_output_value: true },
  { input_type: 'array', input_value: [['8', '3', '.', '.', '7', '.', '.', '.', '.'], ['6', '.', '.', '1', '9', '5', '.', '.', '.'], ['.', '9', '8', '.', '.', '.', '.', '6', '.'], ['8', '.', '.', '.', '6', '.', '.', '.', '3'], ['4', '.', '.', '8', '.', '3', '.', '.', '1'], ['7', '.', '.', '.', '2', '.', '.', '.', '6'], ['.', '6', '.', '.', '.', '.', '2', '8', '.'], ['.', '.', '.', '4', '1', '9', '.', '.', '5'], ['.', '.', '.', '.', '8', '.', '.', '7', '9']], expected_output_type: 'boolean', expected_output_value: false },
  { input_type: 'array', input_value: [['.', '.', '.', '.', '.', '.', '.', '.', '.'], ['.', '.', '.', '.', '.', '.', '.', '.', '.'], ['.', '.', '.', '.', '.', '.', '.', '.', '.'], ['.', '.', '.', '.', '.', '.', '.', '.', '.'], ['.', '.', '.', '.', '.', '.', '.', '.', '.'], ['.', '.', '.', '.', '.', '.', '.', '.', '.'], ['.', '.', '.', '.', '.', '.', '.', '.', '.'], ['.', '.', '.', '.', '.', '.', '.', '.', '.'], ['.', '.', '.', '.', '.', '.', '.', '.', '.']], expected_output_type: 'boolean', expected_output_value: true },
  { input_type: 'array', input_value: [['1', '2', '3', '4', '5', '6', '7', '8', '9'], ['2', '3', '4', '5', '6', '7', '8', '9', '1'], ['3', '4', '5', '6', '7', '8', '9', '1', '2'], ['4', '5', '6', '7', '8', '9', '1', '2', '3'], ['5', '6', '7', '8', '9', '1', '2', '3', '4'], ['6', '7', '8', '9', '1', '2', '3', '4', '5'], ['7', '8', '9', '1', '2', '3', '4', '5', '6'], ['8', '9', '1', '2', '3', '4', '5', '6', '7'], ['9', '1', '2', '3', '4', '5', '6', '7', '8']], expected_output_type: 'boolean', expected_output_value: false },
  { input_type: 'array', input_value: [['1', '2', '3', '4', '5', '6', '7', '8', '9'], ['4', '5', '6', '7', '8', '9', '1', '2', '3'], ['7', '8', '9', '1', '2', '3', '4', '5', '6'], ['2', '3', '4', '5', '6', '7', '8', '9', '1'], ['5', '6', '7', '8', '9', '1', '2', '3', '4'], ['8', '9', '1', '2', '3', '4', '5', '6', '7'], ['3', '4', '5', '6', '7', '8', '9', '1', '2'], ['6', '7', '8', '9', '1', '2', '3', '4', '5'], ['9', '1', '2', '3', '4', '5', '6', '7', '8']], expected_output_type: 'boolean', expected_output_value: true }
]

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end


## Max Subarray Sum

prompt = Prompt.create(
  title: "Max Subarray Sum",
  content: "Write a function solve that finds the contiguous subarray with the largest sum within an array of integers and returns the sum. A subarray must contain at least one element.",
  example: "Input: [-2, 1, -3, 4, -1, 2, 1, -5, 4] Expected Output: 6 (subarray [4, -1, 2, 1])",
  display_date: Date.current + 15.days
)

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases = [
  { input_type: 'array', input_value: [-2, 1, -3, 4, -1, 2, 1, -5, 4], expected_output_type: 'integer', expected_output_value: 6 },
  { input_type: 'array', input_value: [1], expected_output_type: 'integer', expected_output_value: 1 },
  { input_type: 'array', input_value: [5, 4, -1, 7, 8], expected_output_type: 'integer', expected_output_value: 23 },
  { input_type: 'array', input_value: [-1, -2, -3, -4], expected_output_type: 'integer', expected_output_value: -1 },
  { input_type: 'array', input_value: [-2, -1, -3, -4, -1, -2, -1, -5, -4], expected_output_type: 'integer', expected_output_value: -1 }
]

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end



## Implement Queue using Stacks

prompt = Prompt.create(
  title: "Implement Queue using Stacks",
  content: "Write a class `MyQueue` that implements a queue using only two stacks. Operations should include: push (to back of queue), peek (at front of queue), pop (from front of queue), and empty (returns boolean).",
  example: "Input: ['MyQueue', 'push', 'push', 'peek', 'pop', 'empty'], [[], [1], [2], [], [], []] Expected Output: [null, null, null, 1, 1, false]",
  display_date: Date.current + 16.days
)

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases = [
  { input_type: 'array', input_value: [['MyQueue', 'push', 'push', 'peek', 'pop', 'empty'], [[], [1], [2], [], [], []]], expected_output_type: 'array', expected_output_value: [nil, nil, nil, 1, 1, false] },
  { input_type: 'array', input_value: [['MyQueue', 'push', 'pop', 'empty'], [[], [1], [], []]], expected_output_type: 'array', expected_output_value: [nil, nil, 1, true] },
  { input_type: 'array', input_value: [['MyQueue', 'push', 'push', 'push', 'pop', 'pop', 'pop', 'empty'], [[], [1], [2], [3], [], [], [], []]], expected_output_type: 'array', expected_output_value: [nil, nil, nil, nil, 1, 2, 3, true] },
  { input_type: 'array', input_value: [['MyQueue', 'empty', 'push', 'empty'], [[], [], [1], []]], expected_output_type: 'array', expected_output_value: [nil, true, nil, false] },
  { input_type: 'array', input_value: [['MyQueue', 'push', 'peek', 'peek', 'pop', 'push', 'pop', 'peek', 'empty'], [[], [5], [], [], [], [10], [], [], []]], expected_output_type: 'array', expected_output_value: [nil, nil, 5, 5, 5, nil, 10, nil, true] }
]

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end


##  First Unique Character

prompt = Prompt.create(
  title: "First Unique Character",
  content: "Write a function solve that takes a string and returns the index of the first non-repeating character in it. If there is no non-repeating character, return -1.",
  example: "Input: 'leetcode' Expected Output: 0 (since 'l' is the first non-repeating character)",
  display_date: Date.current + 17.days
)

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases = [
  { input_type: 'string', input_value: 'leetcode', expected_output_type: 'integer', expected_output_value: 0 },
  { input_type: 'string', input_value: 'loveleetcode', expected_output_type: 'integer', expected_output_value: 2 },
  { input_type: 'string', input_value: 'aabb', expected_output_type: 'integer', expected_output_value: -1 },
  { input_type: 'string', input_value: '', expected_output_type: 'integer', expected_output_value: -1 },
  { input_type: 'string', input_value: 'z', expected_output_type: 'integer', expected_output_value: 0 }
]

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end


## Reverse Words in String

prompt = Prompt.create(
  title: "Reverse Words in String",
  content: "Write a function solve that reverses the order of words in a string. A word is defined as a sequence of non-space characters. The words in s will be separated by at least one space. Return the reversed string with a single space between words, and no leading or trailing spaces.",
  example: "Input: 'the sky is blue' Expected Output: 'blue is sky the'",
  display_date: Date.current + 18.days
)

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases = [
  { input_type: 'string', input_value: 'the sky is blue', expected_output_type: 'string', expected_output_value: 'blue is sky the' },
  { input_type: 'string', input_value: '  hello world  ', expected_output_type: 'string', expected_output_value: 'world hello' },
  { input_type: 'string', input_value: 'a good   example', expected_output_type: 'string', expected_output_value: 'example good a' },
  { input_type: 'string', input_value: 'ruby is awesome', expected_output_type: 'string', expected_output_value: 'awesome is ruby' },
  { input_type: 'string', input_value: 'single', expected_output_type: 'string', expected_output_value: 'single' }
]

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end


## LRU Cache

prompt = Prompt.create(
  title: "LRU Cache",
  content: "Implement an `LRUCache` class that supports get and put operations. The cache should have a fixed capacity and when the capacity is exceeded, it should evict the least recently used item. The `get` method should retrieve a value for a key, or return -1 if not found. The `put` method should add or update a key-value pair and evict items if necessary.",
  example: "Input: ['LRUCache', 'put', 'put', 'get', 'put', 'get', 'put', 'get', 'get', 'get'], [[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]] Expected Output: [null, null, null, 1, null, -1, null, -1, 3, 4]",
  display_date: Date.current + 19.days
)

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases = [
  { input_type: 'array', input_value: [['LRUCache', 'put', 'put', 'get', 'put', 'get', 'put', 'get', 'get', 'get'], [[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]], expected_output_type: 'array', expected_output_value: [nil, nil, nil, 1, nil, -1, nil, -1, 3, 4] },
  { input_type: 'array', input_value: [['LRUCache', 'put', 'get'], [[1], [1, 1], [1]]], expected_output_type: 'array', expected_output_value: [nil, nil, 1] },
  { input_type: 'array', input_value: [['LRUCache', 'put', 'put', 'put', 'get'], [[2], [1, 1], [2, 2], [3, 3], [1]]], expected_output_type: 'array', expected_output_value: [nil, nil, nil, nil, -1] },
  { input_type: 'array', input_value: [['LRUCache', 'put', 'put', 'get', 'get', 'put', 'get', 'get', 'get'], [[2], [1, 1], [2, 2], [1], [2], [3, 3], [2], [3], [1]]], expected_output_type: 'array', expected_output_value: [nil, nil, nil, 1, 2, nil, 2, 3, -1] },
  { input_type: 'array', input_value: [['LRUCache', 'put', 'put', 'put', 'put', 'get', 'get'], [[2], [2, 1], [1, 1], [2, 3], [4, 1], [1], [2]]], expected_output_type: 'array', expected_output_value: [nil, nil, nil, nil, nil, -1, 3] }
]

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end


## Implement Set Data Structure

prompt = Prompt.create(
  title: "Implement Set Data Structure",
  content: "Create a class `MySet` that mimics the behavior of a mathematical set. It should support operations: add (adds an element), remove (removes an element), contains (checks if an element exists), and size (returns the number of elements).",
  example: "Input: ['MySet', 'add', 'add', 'contains', 'contains', 'size', 'remove', 'contains', 'size'], [[], [1], [2], [1], [3], [], [1], [1], []] Expected Output: [null, null, null, true, false, 2, null, false, 1]",
  display_date: Date.current + 20.days
)

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases = [
  { input_type: 'array', input_value: [['MySet', 'add', 'add', 'contains', 'contains', 'size', 'remove', 'contains', 'size'], [[], [1], [2], [1], [3], [], [1], [1], []]], expected_output_type: 'array', expected_output_value: [nil, nil, nil, true, false, 2, nil, false, 1] },
  { input_type: 'array', input_value: [['MySet', 'add', 'add', 'add', 'size', 'remove', 'size'], [[], [1], [1], [2], [], [2], []]], expected_output_type: 'array', expected_output_value: [nil, nil, nil, nil, 2, nil, 1] },
  { input_type: 'array', input_value: [['MySet', 'add', 'add', 'remove', 'add', 'size', 'contains', 'contains', 'contains'], [[], ['a'], ['b'], ['a'], ['c'], [], ['a'], ['b'], ['c']]], expected_output_type: 'array', expected_output_value: [nil, nil, nil, nil, nil, 2, false, true, true] },
  { input_type: 'array', input_value: [['MySet', 'size', 'contains', 'remove', 'size'], [[], [], [1], [1], []]], expected_output_type: 'array', expected_output_value: [nil, 0, false, nil, 0] },
  { input_type: 'array', input_value: [['MySet', 'add', 'add', 'add', 'add', 'add', 'size', 'remove', 'remove', 'size'], [[], [1], [2], [3], [4], [5], [], [1], [5], []]], expected_output_type: 'array', expected_output_value: [nil, nil, nil, nil, nil, nil, 5, nil, nil, 3] }
]

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end


## Valid Bracket Sequence

prompt = Prompt.create(
  title: "Valid Bracket Sequence",
  content: "Write a function solve that takes a string of brackets and determines if the sequence forms a valid bracket sequence. Return true if the sequence is valid, false otherwise. Valid brackets are '()', '{}', and '[]'.",
  example: "Input: '{[()]}' Expected Output: true",
  display_date: Date.current + 21.days
)

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases = [
  { input_type: 'string', input_value: '{[()]}', expected_output_type: 'boolean', expected_output_value: true },
  { input_type: 'string', input_value: '([)]', expected_output_type: 'boolean', expected_output_value: false },
  { input_type: 'string', input_value: '([])', expected_output_type: 'boolean', expected_output_value: true },
  { input_type: 'string', input_value: '}', expected_output_type: 'boolean', expected_output_value: false },
  { input_type: 'string', input_value: '({[{[()]}]})', expected_output_type: 'boolean', expected_output_value: true }
]

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end


## Implement Trie (Prefix Tree)

prompt = Prompt.create(
  title: "Implement Trie (Prefix Tree)",
  content: "Implement a Trie (Prefix Tree) data structure. The class should support insert, search, and startsWith methods. The insert method adds a word to the trie, search checks if the word exists, and startsWith checks if there is any word that starts with the given prefix.",
  example: "Input: ['Trie', 'insert', 'search', 'search', 'startsWith', 'insert', 'search'], [[], ['apple'], ['apple'], ['app'], ['app'], ['app'], ['app']] Expected Output: [null, null, true, false, true, null, true]",
  display_date: Date.current + 22.days
)

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases = [
  { input_type: 'array', input_value: [['Trie', 'insert', 'search', 'search', 'startsWith', 'insert', 'search'], [[], ['apple'], ['apple'], ['app'], ['app'], ['app'], ['app']]], expected_output_type: 'array', expected_output_value: [nil, nil, true, false, true, nil, true] },
  { input_type: 'array', input_value: [['Trie', 'insert', 'search', 'startsWith'], [[], ['hello'], ['hell'], ['hell']]], expected_output_type: 'array', expected_output_value: [nil, nil, false, true] },
  { input_type: 'array', input_value: [['Trie', 'insert', 'insert', 'search', 'search', 'search', 'startsWith', 'startsWith'], [[], ['dog'], ['dot'], ['dog'], ['dot'], ['do'], ['do'], ['daddy']]], expected_output_type: 'array', expected_output_value: [nil, nil, nil, true, true, false, true, false] },
  { input_type: 'array', input_value: [['Trie', 'insert', 'insert', 'insert', 'search', 'search', 'startsWith', 'startsWith', 'startsWith'], [[], ['code'], ['coder'], ['coding'], ['cod'], ['coder'], ['co'], ['codi'], ['codin']]], expected_output_type: 'array', expected_output_value: [nil, nil, nil, nil, false, true, true, true, true] },
  { input_type: 'array', input_value: [['Trie', 'insert', 'search', 'startsWith', 'startsWith', 'insert', 'search', 'startsWith'], [[], [''], [''], [''], ['a'], ['a'], ['a'], ['a']]], expected_output_type: 'array', expected_output_value: [nil, nil, true, true, false, nil, true, true] }
]

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end


## Two Sum

prompt = Prompt.create(
  title: "Two Sum",
  content: "Write a function solve that takes an array of integers and a target value, and returns the indices of the two numbers that add up to the target. You may assume that each input has exactly one solution, and you cannot use the same element twice.",
  example: "Input: [2, 7, 11, 15], 9 Expected Output: [0, 1]",
  display_date: Date.current + 23.days
)

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases = [
  { input_type: 'array', input_value: [[2, 7, 11, 15], 9], expected_output_type: 'array', expected_output_value: [0, 1] },
  { input_type: 'array', input_value: [[3, 2, 4], 6], expected_output_type: 'array', expected_output_value: [1, 2] },
  { input_type: 'array', input_value: [[3, 3], 6], expected_output_type: 'array', expected_output_value: [0, 1] },
  { input_type: 'array', input_value: [[1, 5, 8, 3, 9, 2], 10], expected_output_type: 'array', expected_output_value: [1, 2] },
  { input_type: 'array', input_value: [[-1, -2, -3, -4, -5], -8], expected_output_type: 'array', expected_output_value: [2, 4] }
]

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end


## Rotate Image

prompt = Prompt.create(
  title: "Rotate Image",
  content: "Write a function solve that rotates an n × n 2D matrix representing an image by 90 degrees clockwise in-place. The matrix is represented as arrays of arrays, where the outer array is rows and the inner arrays are columns.",
  example: "Input: [[1, 2, 3], [4, 5, 6], [7, 8, 9]] Expected Output: [[7, 4, 1], [8, 5, 2], [9, 6, 3]]",
  display_date: Date.current + 24.days
)

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases = [
  { input_type: 'array', input_value: [[1, 2, 3], [4, 5, 6], [7, 8, 9]], expected_output_type: 'array', expected_output_value: [[7, 4, 1], [8, 5, 2], [9, 6, 3]] },
  { input_type: 'array', input_value: [[5, 1, 9, 11], [2, 4, 8, 10], [13, 3, 6, 7], [15, 14, 12, 16]], expected_output_type: 'array', expected_output_value: [[15, 13, 2, 5], [14, 3, 4, 1], [12, 6, 8, 9], [16, 7, 10, 11]] },
  { input_type: 'array', input_value: [[1]], expected_output_type: 'array', expected_output_value: [[1]] },
  { input_type: 'array', input_value: [[1, 2], [3, 4]], expected_output_type: 'array', expected_output_value: [[3, 1], [4, 2]] },
  { input_type: 'array', input_value: [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]], expected_output_type: 'array', expected_output_value: [[13, 9, 5, 1], [14, 10, 6, 2], [15, 11, 7, 3], [16, 12, 8, 4]] }
]

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end


## Subarray Sum Equals K

prompt = Prompt.create(
  title: "Subarray Sum Equals K",
  content: "Write a function solve that takes an array of integers and an integer k, and returns the total number of continuous subarrays whose sum equals k.",
  example: "Input: [1, 1, 1], 2 Expected Output: 2",
  display_date: Date.current + 25.days
)

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases = [
  { input_type: 'array', input_value: [[1, 1, 1], 2], expected_output_type: 'integer', expected_output_value: 2 },
  { input_type: 'array', input_value: [[1, 2, 3], 3], expected_output_type: 'integer', expected_output_value: 2 },
  { input_type: 'array', input_value: [[1], 0], expected_output_type: 'integer', expected_output_value: 0 },
  { input_type: 'array', input_value: [[1, -1, 0], 0], expected_output_type: 'integer', expected_output_value: 3 },
  { input_type: 'array', input_value: [[3, 4, 7, 2, -3, 1, 4, 2], 7], expected_output_type: 'integer', expected_output_value: 4 }
]

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end


##  Merge Intervals

prompt = Prompt.create(
  title: "Merge Intervals",
  content: "Write a function solve that takes an array of intervals and merges all overlapping intervals. Return the merged intervals sorted by their start time.",
  example: "Input: [[1, 3], [2, 6], [8, 10], [15, 18]] Expected Output: [[1, 6], [8, 10], [15, 18]]",
  display_date: Date.current + 26.days
)

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases = [
  { input_type: 'array', input_value: [[1, 3], [2, 6], [8, 10], [15, 18]], expected_output_type: 'array', expected_output_value: [[1, 6], [8, 10], [15, 18]] },
  { input_type: 'array', input_value: [[1, 4], [4, 5]], expected_output_type: 'array', expected_output_value: [[1, 5]] },
  { input_type: 'array', input_value: [[1, 4], [0, 4]], expected_output_type: 'array', expected_output_value: [[0, 4]] },
  { input_type: 'array', input_value: [[1, 4], [2, 3]], expected_output_type: 'array', expected_output_value: [[1, 4]] },
  { input_type: 'array', input_value: [[1, 10], [2, 6], [3, 5], [7, 9]], expected_output_type: 'array', expected_output_value: [[1, 10]] }
]

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end


## Serialize and Deserialize Binary Tree

prompt = Prompt.create(
  title: "Serialize and Deserialize Binary Tree",
  content: "Implement two methods: `serialize` and `deserialize`. The `serialize` method converts a binary tree to a string representation, and the `deserialize` method reconstructs the tree from the string. Each node contains an integer value.",
  example: "Input: root = [1, 2, 3, null, null, 4, 5] Operations: [tree = deserialize(serialize(root))] Expected Output: [1, 2, 3, null, null, 4, 5]",
  display_date: Date.current + 27.days
)

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases = [
  { input_type: 'array', input_value: [[1, 2, 3, nil, nil, 4, 5]], expected_output_type: 'array', expected_output_value: [1, 2, 3, nil, nil, 4, 5] },
  { input_type: 'array', input_value: [[]], expected_output_type: 'array', expected_output_value: [] },
  { input_type: 'array', input_value: [[1]], expected_output_type: 'array', expected_output_value: [1] },
  { input_type: 'array', input_value: [[1, 2, 3, 4, 5]], expected_output_type: 'array', expected_output_value: [1, 2, 3, 4, 5] },
  { input_type: 'array', input_value: [[1, nil, 2, nil, 3, nil, 4, nil, 5]], expected_output_type: 'array', expected_output_value: [1, nil, 2, nil, 3, nil, 4, nil, 5] }
]

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end


## Design an Event Emitter

prompt = Prompt.create(
  title: "Design an Event Emitter",
  content: "Design an `EventEmitter` class that manages event subscriptions and publishes events. The class should support: `subscribe(event_name, callback)` which returns a subscription ID, `unsubscribe(id)` to remove a specific subscription, and `emit(event_name, args)` to trigger all callbacks for that event name with the given arguments.",
  example: "Input: ['EventEmitter', 'subscribe', 'emit', 'unsubscribe', 'emit'], [[], ['click', function(x) { return x * 2; }], ['click', [5]], [0], ['click', [10]]] Expected Output: [null, 0, [10], null, []]",
  display_date: Date.current + 28.days
)

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases = [
  { input_type: 'array', input_value: [['EventEmitter', 'subscribe', 'emit', 'unsubscribe', 'emit'], [[], ['click', 'function(x) { return x * 2; }'], ['click', [5]], [0], ['click', [10]]]], expected_output_type: 'array', expected_output_value: [nil, 0, [10], nil, []] },
  { input_type: 'array', input_value: [['EventEmitter', 'subscribe', 'subscribe', 'emit', 'unsubscribe', 'emit'], [[], ['click', 'function(x) { return x + 1; }'], ['click', 'function(x) { return x * 2; }'], ['click', [5]], [0], ['click', [5]]]], expected_output_type: 'array', expected_output_value: [nil, 0, 1, [6, 10], nil, [10]] },
  { input_type: 'array', input_value: [['EventEmitter', 'subscribe', 'emit', 'subscribe', 'emit', 'unsubscribe', 'emit'], [[], ['event1', 'function() { return "hello"; }'], ['event1', []], ['event2', 'function() { return "world"; }'], ['event2', []], [1], ['event2', []]]], expected_output_type: 'array', expected_output_value: [nil, 0, ["hello"], 1, ["world"], nil, []] },
  { input_type: 'array', input_value: [['EventEmitter', 'subscribe', 'subscribe', 'subscribe', 'emit', 'unsubscribe', 'unsubscribe', 'emit'], [[], ['click', 'function(x) { return x; }'], ['click', 'function(x) { return x + 1; }'], ['click', 'function(x) { return x + 2; }'], ['click', [5]], [0], [2], ['click', [5]]]], expected_output_type: 'array', expected_output_value: [nil, 0, 1, 2, [5, 6, 7], nil, nil, [6]] },
  { input_type: 'array', input_value: [['EventEmitter', 'subscribe', 'emit', 'emit', 'unsubscribe', 'emit'], [[], ['event', 'function(a, b) { return a + b; }'], ['event', [2, 3]], ['other', [1, 2]], [0], ['event', [2, 3]]]], expected_output_type: 'array', expected_output_value: [nil, 0, [5], [], nil, []] }
]

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end

## JSON Parser

prompt = Prompt.create(
  title: "JSON Parser",
  content: "Write a function solve that parses a JSON string and returns the corresponding Ruby object. Support the basic JSON types: null, boolean, number, string, array, and object. You cannot use Ruby's built-in JSON parsing.",
  example: "Input: '{\"name\":\"John\",\"age\":30,\"isStudent\":false,\"courses\":[\"Math\",\"English\"]}' Expected Output: {'name'=>'John', 'age'=>30, 'isStudent'=>false, 'courses'=>['Math', 'English']}",
  display_date: Date.current + 29.days
)

prompt.test_suite = TestSuite.create()
ts = prompt.test_suite

test_cases = [
  { input_type: 'string', input_value: '{"name":"John","age":30,"isStudent":false,"courses":["Math","English"]}', expected_output_type: 'hash', expected_output_value: {'name'=>'John', 'age'=>30, 'isStudent'=>false, 'courses'=>['Math', 'English']} },
  { input_type: 'string', input_value: '[1,2,3,4,5]', expected_output_type: 'array', expected_output_value: [1, 2, 3, 4, 5] },
  { input_type: 'string', input_value: 'null', expected_output_type: 'nil', expected_output_value: nil },
  { input_type: 'string', input_value: '{"a":{"b":{"c":1}},"d":[1,2,3]}', expected_output_type: 'hash', expected_output_value: {'a'=>{'b'=>{'c'=>1}}, 'd'=>[1, 2, 3]} },
  { input_type: 'string', input_value: '{"bool":true,"array":[false,null,123,"text"]}', expected_output_type: 'hash', expected_output_value: {'bool'=>true, 'array'=>[false, nil, 123, 'text']} }
]

test_cases.each do |tc|
  ts.test_cases.create!(tc)
end