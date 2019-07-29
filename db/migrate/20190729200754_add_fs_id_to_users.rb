class AddFsIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :fs_id, :string
  end
end
