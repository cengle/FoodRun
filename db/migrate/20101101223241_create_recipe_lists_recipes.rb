class CreateRecipeListsRecipes < ActiveRecord::Migration
  def self.up
    create_table :recipe_lists_recipes, :id => false do |t|
	  t.integer :recipe_id, :null => false
	  t.integer :recipe_list_id, :null => false
	end
  end

  def self.down
    drop_table :recipe_lists_recipes
  end
end
