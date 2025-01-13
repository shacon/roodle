class TestSuite < ApplicationRecord
  belongs_to :prompt
  has_many :test_cases
end
