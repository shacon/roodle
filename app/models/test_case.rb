class TestCase < ApplicationRecord
  belongs_to :test_suite

  def prepared_input
    input_value.to_json
  end
end
