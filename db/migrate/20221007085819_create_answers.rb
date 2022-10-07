class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.text :title, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
