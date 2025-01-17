class AddDisplayDateToPrompt < ActiveRecord::Migration[7.2]
  def change
    add_column :prompts, :display_date, :datetime
    add_index :prompts, :display_date, unique: true
  end
end
