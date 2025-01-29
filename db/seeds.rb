
prompt = Prompt.create(
    title: "Maximum Subarray",
    content: "Write a function solve that finds the nonempty contiguous subarray with the largest sum in a list.",
    example: "Input: [-2,1,-3,4,-1,2,1,-5,4] Output: 6 ",
    display_date: Date.current
  )
prompt.test_suite = TestSuite.create()

ts=prompt.test_suite
ts.test_cases.create(input:"[-2,1,-3,4,-1,2,1,-5,4]", expected_output: "6")
ts.test_cases.create(input: "[-1,-2,-3,-4,-5]", expected_output: "-1")
ts.test_cases.create(input: "[1,2,3,4,5]", expected_output: "15")
ts.test_cases.create(input: "[42]", expected_output: "42")
ts.test_cases.create(input: "[-1,2,-3,4,5,-6,1]", expected_output: "9")

prompt = Prompt.create(
    title: "Reverse String",
    content: "Write a function solve that takes in a string as input and returns the reverse of that string",
    example: "Input: 'cat' Output: 'tac' ",
    # display_date: Date.current
  )