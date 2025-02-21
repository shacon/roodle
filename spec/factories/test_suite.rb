FactoryBot.define do
  factory :test_suite do
    after(:create) do |test_suite|
      create(:test_case, test_suite: test_suite)
    end
  end
end
