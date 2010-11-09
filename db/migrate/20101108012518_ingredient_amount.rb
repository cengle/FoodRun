class IngredientAmount < ActiveRecord::Migration
  def self.up
    rename_table :ingredients_recipes, :ingredient_amounts
  end

  def self.down
    rename_table :ingredient_amounts, :ingredients_recipes
  end
end
