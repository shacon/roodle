class Prompt < ApplicationRecord
  has_one :test_suite

  def self.for_today
    prompt = find_by(display_date: Date.current)
    if !prompt
      prompt = Prompt.last
    end
    prompt
  end
end
