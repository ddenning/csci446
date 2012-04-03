class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.string :rating
      t.integer :user_id

      t.timestamps
    end
  end
end
