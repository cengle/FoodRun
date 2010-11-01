require 'spec_helper'

describe "/ingredients/new.html.erb" do
  include IngredientsHelper

  before(:each) do
    assigns[:ingredient] = stub_model(Ingredient,
      :new_record? => true,
      :name => "value for name",
      :number => 1,
      :unit => "value for unit",
      :section => "value for section",
      :recipe_id => 1
    )
  end

  it "renders new ingredient form" do
    render

    response.should have_tag("form[action=?][method=post]", ingredients_path) do
      with_tag("input#ingredient_name[name=?]", "ingredient[name]")
      with_tag("input#ingredient_number[name=?]", "ingredient[number]")
      with_tag("input#ingredient_unit[name=?]", "ingredient[unit]")
      with_tag("input#ingredient_section[name=?]", "ingredient[section]")
      with_tag("input#ingredient_recipe_id[name=?]", "ingredient[recipe_id]")
    end
  end
end
