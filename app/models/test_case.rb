class TestCase < ApplicationRecord
  belongs_to :test_suite

  def prepared_input
    Rails.logger.info("in prepared input the input is: #{input_value}")
    input_value.to_json
  end
end
