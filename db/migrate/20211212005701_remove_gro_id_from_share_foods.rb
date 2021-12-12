class RemoveGroIdFromShareFoods < ActiveRecord::Migration[5.2]
  def change
    remove_column :share_foods, :gro_id, :integer
  end
end
