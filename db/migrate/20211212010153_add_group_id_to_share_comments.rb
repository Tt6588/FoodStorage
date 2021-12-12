class AddGroupIdToShareComments < ActiveRecord::Migration[5.2]
  def change
    add_column :share_comments, :group_id, :integer
  end
end
