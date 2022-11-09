class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.integer :answers
      t.integer :correct
      t.integer :questions
      t.float :percentage
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
