class AddRecipeListToUser < ActiveRecord::Migration
  def self.up
	add_column :recipe_lists, :user_id, :int
  end

  def self.down
	remove_column :recipe_lists, :user_id
  end
end
