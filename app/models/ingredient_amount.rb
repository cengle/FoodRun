class IngredientAmount < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :recipe
  def ingredient_name= name	
    i = Ingredient.find_by_name(name.downcase().titleize())
	if i
		self.ingredient_id = i.id
	else
		i = Ingredient.create
		i.name = name.downcase().titleize()
		i.save
		self.ingredient_id = i.id
	end
  end
  def ingredient_name	
	ingredient ? ingredient.name : nil
  end
end
