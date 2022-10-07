class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.text :title
      t.text :description
      t.text :correct_answer

      t.timestamps
    end
  end
end
