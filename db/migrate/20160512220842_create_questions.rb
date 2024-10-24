class CreateQuestions < ActiveRecord::Migration[7.2]
  def change
    create_table :questions do |t|
      t.string :title,     null: false
      t.boolean :private,  default: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
