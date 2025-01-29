class TestCase < ApplicationRecord
  belongs_to :test_suite
  
  def prepared_input
    # special parsing happens here
    input
  end
end
