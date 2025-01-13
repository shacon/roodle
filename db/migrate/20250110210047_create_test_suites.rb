class CreateTestSuites < ActiveRecord::Migration[7.2]
  def change
    create_table :test_suites do |t|
      t.timestamps
      t.belongs_to :prompt
    end
  end
end
