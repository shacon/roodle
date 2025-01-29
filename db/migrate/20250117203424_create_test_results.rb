class CreateTestResults < ActiveRecord::Migration[7.2]
  def change
    create_table :test_results do |t|
      t.references :code_submission, null: false, foreign_key: true
      t.jsonb :results
      t.string :error_message

      t.timestamps
    end
  end
end
