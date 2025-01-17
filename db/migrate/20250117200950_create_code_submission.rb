class CreateCodeSubmission < ActiveRecord::Migration[7.2]
  def change
    create_table :code_submissions do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.references :prompt, foreign_key: true
      t.string :status, default: 'pending'

      t.timestamps
    end
  end
end
