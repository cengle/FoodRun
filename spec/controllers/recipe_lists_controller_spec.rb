require 'spec_helper'

describe RecipeListsController do

  def mock_recipe_list(stubs={})
    @mock_recipe_list ||= mock_model(RecipeList, stubs)
  end

  def mock_recipe(stubs={})
    @mock_recipe ||= mock_model(Recipe, stubs)
  end

  describe "adding a recipe to a recipe list" do
    it "adds the current recipe to a recipe list" do
	  reclist = RecipeList.create
	  new_recipe = Recipe.create(:description => "chicken is yummy", :title=>"Chicken", :directions=>"Cook", :completion_time=>5)
	  #reclist = mock_recipe_list
	  #new_recipe = mock_recipe
	  reclist.recipes = [new_recipe]
	  reclist.recipes.should include(new_recipe)
	  #Recipe.stub(:find).and_return(new_recipe)
	  #RecipeList.stub(:find).and_return(reclist)
	  
	end
  end
  
=begin   
  describe "grocery list" do
  	it "should return an array of 'super-ingredients' as the grocery list" do
  		recipe_list = RecipeList.create
  		
  		chicken_burrito_tortilla = Ingredient.create(:name => "tortilla", :number => 2)
  		chicken_burrito_meat = Ingredient.create(:name => "chicken", :number => 5, :unit => "pounds", :section => "meats")
  		chicken_burrito_ingredients = [chicken_burrito_tortilla, chicken_burrito_meat]
  		chicken_burrito_recipe = Recipe.create(:title => "chicken burrito", :ingredients => chicken_burrito_ingredients)
  		recipe_list.recipes << chicken_burrito_recipe
  		
  		steak_burrito_tortilla = Ingredient.create(:name => "tortilla", :number => 5)
  		steak_burrito_meat = Ingredient.create(:name => "steak", :number => 10, :unit => "pounds", :section => "meats")
  		steak_burrito_ingredients = [steak_burrito_tortilla, steak_burrito_meat]
  		steak_burrito_recipe = Recipe.create(:title => "steak burrito", :ingredients => steak_burrito_ingredients)
  		recipe_list.recipes << steak_burrito_recipe
  		
  	end
  	
  end
=end
end
