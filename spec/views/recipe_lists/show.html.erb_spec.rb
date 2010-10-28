require 'spec_helper'

describe "/recipe_lists/show.html.erb" do
  include RecipeListsHelper
  before(:each) do
    assigns[:recipe_list] = @recipe_list = stub_model(RecipeList)
  end

  it "renders attributes in <p>" do
    render
  end
end
