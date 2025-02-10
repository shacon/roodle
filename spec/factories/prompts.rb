FactoryBot.define do
  factory :prompt do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
    example { Faker::Lorem.paragraph }
    display_date { Faker::Date.between(from: 1.year.ago, to: Date.today) }

    after(:create) do |prompt|
      create(:test_suite, prompt: prompt)
    end
  end
end