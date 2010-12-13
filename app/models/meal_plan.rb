class MealPlan < ActiveRecord::Base
	has_and_belongs_to_many :recipes
	belongs_to :user
	def removeRecipe(recipe_to_delete)
    		recipes.delete(recipes.find(recipe_to_delete))
  	end
end
