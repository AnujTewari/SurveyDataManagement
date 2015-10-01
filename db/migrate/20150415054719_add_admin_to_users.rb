class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :int, :default => 0
  end
end
