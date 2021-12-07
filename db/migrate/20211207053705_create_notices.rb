class CreateNotices < ActiveRecord::Migration[5.2]
  def change
    create_table :notices do |t|
      
      t.integer :visitor_id
      t.integer :visitor_group_id
      t.integer :visited_id
      t.integer :food_id
      t.integer :share_food_id
      t.integer :comment_id
      t.integer :share_comment_id
      t.string :action
      t.boolean :checked, default: false

      t.timestamps
    end
  end
end
