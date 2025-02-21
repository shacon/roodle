class CodeSubmission < ApplicationRecord
  belongs_to :user
  belongs_to :prompt
  has_many :test_results
end
