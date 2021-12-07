class CreateShareFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :share_foods do |t|
      
      t.integer :gro_id
      t.integer :genre_id
      t.string :food_name
      t.text :detail
      t.string :image_id
      t.string :quantity
      t.datetime :deadline_time

      t.timestamps
    end
  end
end
