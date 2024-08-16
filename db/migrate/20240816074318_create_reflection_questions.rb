class CreateReflectionQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :reflection_questions do |t|
      t.string :question
      t.integer :day_id

      t.timestamps
    end
  end
end
