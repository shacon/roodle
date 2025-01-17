class Prompt < ApplicationRecord
  has_one :test_suite
  scope :for_today, -> { find_by(display_date: Date.current) }
end
