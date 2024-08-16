class CreateDays < ActiveRecord::Migration[7.1]
  def change
    create_table :days do |t|
      t.integer :week_id
      t.integer :goal_id
      t.string :entries
      t.string :day
      t.integer :user_id
      t.string :g1_workedon
      t.string :g2_workedon
      t.string :g3_workedon
      t.string :g5
      t.string :g4_workedon
      t.string :g5_workedon
      t.string :g1
      t.string :g2
      t.string :g3
      t.string :g4

      t.timestamps
    end
  end
end
