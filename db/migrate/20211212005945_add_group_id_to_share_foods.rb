class AddGroupIdToShareFoods < ActiveRecord::Migration[5.2]
  def change
    add_column :share_foods, :group_id, :integer
  end
end
