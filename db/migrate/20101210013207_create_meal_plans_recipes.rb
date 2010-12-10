class CreateMealPlansRecipes < ActiveRecord::Migration
  def self.up
	create_table :meal_plans_recipes, :id => false do |t|
		t.integer :recipe_id, :null => false
		t.integer :meal_plans_id, :null => false	
	end
  end

  def self.down
	drop_table :meal_plans_recipes
  end
end

