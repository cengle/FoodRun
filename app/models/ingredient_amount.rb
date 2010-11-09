class IngredientAmount < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :recipe
  def ingredient_name= name
    i = Ingredient.find_by_name(name)
    if i
      id = i.id
      self.ingredient_id = id
    else
      i = self.build_ingredient
      i.name = name
    end
  end
  def ingredient_name
    ingredient ? ingredient.name : nil
  end
end
