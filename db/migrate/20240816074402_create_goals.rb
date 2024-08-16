class CreateGoals < ActiveRecord::Migration[7.1]
  def change
    create_table :goals do |t|
      t.string :g1
      t.string :g2
      t.string :g3
      t.string :g4
      t.string :g5

      t.timestamps
    end
  end
end
