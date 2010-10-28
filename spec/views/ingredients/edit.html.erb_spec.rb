require 'spec_helper'

describe "/ingredients/edit.html.erb" do
  include IngredientsHelper

  before(:each) do
    assigns[:ingredient] = @ingredient = stub_model(Ingredient,
      :new_record? => false,
      :name => "value for name",
      :number => 1,
      :unit => "value for unit",
      :type => "value for type",
      :recipe_id => 1
    )
  end

  it "renders the edit ingredient form" do
    render

    response.should have_tag("form[action=#{ingredient_path(@ingredient)}][method=post]") do
      with_tag('input#ingredient_name[name=?]', "ingredient[name]")
      with_tag('input#ingredient_number[name=?]', "ingredient[number]")
      with_tag('input#ingredient_unit[name=?]', "ingredient[unit]")
      with_tag('input#ingredient_type[name=?]', "ingredient[type]")
      with_tag('input#ingredient_recipe_id[name=?]', "ingredient[recipe_id]")
    end
  end
end
