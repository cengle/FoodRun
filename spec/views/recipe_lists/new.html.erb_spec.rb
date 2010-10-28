require 'spec_helper'

describe "/recipe_lists/new.html.erb" do
  include RecipeListsHelper

  before(:each) do
    assigns[:recipe_list] = stub_model(RecipeList,
      :new_record? => true
    )
  end

  it "renders new recipe_list form" do
    render

    response.should have_tag("form[action=?][method=post]", recipe_lists_path) do
    end
  end
end
