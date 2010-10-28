require 'spec_helper'

describe "/recipe_lists/edit.html.erb" do
  include RecipeListsHelper

  before(:each) do
    assigns[:recipe_list] = @recipe_list = stub_model(RecipeList,
      :new_record? => false
    )
  end

  it "renders the edit recipe_list form" do
    render

    response.should have_tag("form[action=#{recipe_list_path(@recipe_list)}][method=post]") do
    end
  end
end
