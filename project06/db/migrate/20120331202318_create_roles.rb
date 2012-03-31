class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.string :description
      t.integer :users_count, :default => 0

      t.timestamps
    end
  end
end
