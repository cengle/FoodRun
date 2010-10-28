require 'spec_helper'

describe "/recipe_lists/index.html.erb" do
  include RecipeListsHelper

  before(:each) do
    assigns[:recipe_lists] = [
      stub_model(RecipeList),
      stub_model(RecipeList)
    ]
  end

  it "renders a list of recipe_lists" do
    render
  end
end
