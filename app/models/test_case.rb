class TestCase < ApplicationRecord
  belongs_to :test_suite
  
  def prepared_input
    case input_type
    when 'string'
      input_value.to_s
    when 'array'
      input_value.join(' ')
    when 'hash'
      input_value.to_json
    else
      input_value.to_s
    end
  end

end
