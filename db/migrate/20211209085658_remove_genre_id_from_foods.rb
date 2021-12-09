class RemoveGenreIdFromFoods < ActiveRecord::Migration[5.2]
  def change
    remove_column :foods, :genre_id, :integer
  end
end
