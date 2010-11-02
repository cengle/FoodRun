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
	  new_recipe = Recipe.create(:title=>"Chicken", :directions=>"Cook", :completion_time=>5)
	  #reclist = mock_recipe_list
	  #new_recipe = mock_recipe
	  reclist.recipes = [new_recipe]
	  reclist.recipes.should include(new_recipe)
	  #Recipe.stub(:find).and_return(new_recipe)
	  #RecipeList.stub(:find).and_return(reclist)
	  
	end
  end
end
