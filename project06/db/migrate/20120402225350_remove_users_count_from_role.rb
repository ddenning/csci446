class RemoveUsersCountFromRole < ActiveRecord::Migration
  def up
  	remove_column :roles, :users_count
  end

  def down
  	add_column :roles, :users_count, :string, :default => 0
  end
end
