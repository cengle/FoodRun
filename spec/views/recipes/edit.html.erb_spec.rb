require 'spec_helper'

describe "/recipes/edit.html.erb" do
  include RecipesHelper

  before(:each) do
    assigns[:recipe] = @recipe = stub_model(Recipe,
      :new_record? => false,
      :title => "value for title",
      :directions => "value for directions",
      :completion_time => 1,
      :recipelist_id => 1
    )
  end

  it "renders the edit recipe form" do
    render

    response.should have_tag("form[action=#{recipe_path(@recipe)}][method=post]") do
      with_tag('input#recipe_title[name=?]', "recipe[title]")
      with_tag('textarea#recipe_directions[name=?]', "recipe[directions]")
      with_tag('input#recipe_completion_time[name=?]', "recipe[completion_time]")
      with_tag('input#recipe_recipelist_id[name=?]', "recipe[recipelist_id]")
    end
  end
end
