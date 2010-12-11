class UserRecipes < ActiveRecord::Migration
  def self.up
    add_column :recipes, :user_id, :int
  end

  def self.down
	remove_column :recipes, :user_id, :int
  end
end
