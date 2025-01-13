class CreateTestCases < ActiveRecord::Migration[7.2]
  def change
    create_table :test_cases do |t|
      t.text :input
      t.text :expected_output
      t.belongs_to :test_suite

      t.timestamps
    end
  end
end
