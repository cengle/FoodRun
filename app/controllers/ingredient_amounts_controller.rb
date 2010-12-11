class IngredientAmountsController < ApplicationController
	def index
		@ingredients = Ingredient.find(:all, :conditions => ['lower(name) LIKE ?', "#{params[:search].downcase}%"])
	end
end
