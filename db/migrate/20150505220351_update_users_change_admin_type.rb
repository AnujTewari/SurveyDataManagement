class UpdateUsersChangeAdminType < ActiveRecord::Migration
  def change
    remove_column :users, :admin
    add_column :users, :admin, :int, :default => 0
  end
end
