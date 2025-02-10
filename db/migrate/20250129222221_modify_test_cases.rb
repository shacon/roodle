class ModifyTestCases < ActiveRecord::Migration[7.2]
  def change
    create_enum :data_type, %w[
      string
      integer
      float
      boolean
      array
      hash
    ]
    change_table :test_cases do |t|
      t.remove :input
      t.remove :expected_output
      t.column :input_value, :jsonb
      t.column :expected_output_type, :data_type
      t.column :expected_output_value, :jsonb
      t.column :input_type, :data_type
    end
  end
end
