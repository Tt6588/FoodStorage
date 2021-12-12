class AddGroupIdToNotices < ActiveRecord::Migration[5.2]
  def change
    add_column :notices, :group_id, :integer
  end
end
