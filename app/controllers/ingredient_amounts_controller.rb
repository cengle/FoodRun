class IngredientAmountsController < ApplicationController
	def index
          search_tokens = params[:search].downcase().split()
          sql_query = 'lower(name) LIKE ?'
          conditions = []
          conditions[0] = ""
          i = 1
          search_tokens.each do |token|
            conditions[0] << sql_query
            conditions[i] = "%#{token}%"
            conditions[0] << " AND "
            i += 1
          end
          conditions[0] = conditions[0][0..-6] #Remove trailing AND
          # @ingredients = Ingredient.find(:all, :conditions => ['lower(name) LIKE ?', "#{params[:search].downcase}%"])
          @ingredients = Ingredient.find(:all, :conditions => conditions)
          @ingredients.sort!{ |x,y| x.name.length <=> y.name.length}
	end
end
