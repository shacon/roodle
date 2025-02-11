FactoryBot.define do
  factory :test_case do
    test_suite
    input_value { "123456789" }
    input_type { "string" }
    expected_output_type { "string" }
    expected_output_value { "987654321" }
  end
end
