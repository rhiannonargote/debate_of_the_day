class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :category
      t.text :for
      t.text :against
      t.integer :user_id

      t.timestamps null: false
    end
     #add_index :questions, [:user_id, :created_at]
  end
end
