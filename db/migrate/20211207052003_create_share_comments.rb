class CreateShareComments < ActiveRecord::Migration[5.2]
  def change
    create_table :share_comments do |t|
      
      t.integer :user_id
      t.integer :share_food_id
      t.text :comment

      t.timestamps
    end
  end
end
