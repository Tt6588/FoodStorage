class RemoveGenreIdFromShareFoods < ActiveRecord::Migration[5.2]
  def change
    remove_column :share_foods, :genre_id, :integer
  end
end
