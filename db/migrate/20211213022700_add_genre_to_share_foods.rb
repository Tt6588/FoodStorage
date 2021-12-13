class AddGenreToShareFoods < ActiveRecord::Migration[5.2]
  def change
    add_column :share_foods, :genre, :string
  end
end
