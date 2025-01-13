# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
prompt = Prompt.create(title: "Maximum Subarray", content: "Write a function solve that finds the nonempty contiguous subarray with the largest sum in a list.", example: "Input: [-2,1,-3,4,-1,2,1,-5,4] Output: 6 ")


prompt.test_suite = TestSuite.create()

ts=prompt.test_suite
ts.test_cases.create(input:"[-2,1,-3,4,-1,2,1,-5,4]", expected_output: "6")
ts.test_cases.create(input: "[-1,-2,-3,-4,-5]", expected_output: "-1")
ts.test_cases.create(input: "[1,2,3,4,5]", expected_output: "15")
ts.test_cases.create(input: "[42]", expected_output: "42")
ts.test_cases.create(input: "[-1,2,-3,4,5,-6,1]", expected_output: "9")
ts.test_cases.create(input: "[-2,0,3,-1,0,2]", expected_output: "4")