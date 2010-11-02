class RecipeList < ActiveRecord::Base
  has_and_belongs_to_many :recipes
  def removeRecipe(recipe_to_delete)
    recipes.delete(recipes.find(recipe_to_delete))
  end
end
