class CreateEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :entries do |t|
      t.integer :day_id
      t.integer :user_id
      t.string :daily_entry

      t.timestamps
    end
  end
end
