class IngredientAmountsController < ApplicationController
	def index
		@ingredients = Ingredient.find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"])
	end
end
