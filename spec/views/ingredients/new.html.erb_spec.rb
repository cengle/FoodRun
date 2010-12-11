require 'spec_helper'

describe "/ingredients/new.html.erb" do
  include IngredientsHelper

  before(:each) do
    assigns[:ingredient] = stub_model(Ingredient,
      :new_record? => true,
      :name => "value for name",
      :section => "value for section"
    )
  end

  it "renders new ingredient form" do
    render

    response.should have_tag("form[action=?][method=post]", ingredients_path) do
      with_tag("input#ingredient_name[name=?]", "ingredient[name]")
      with_tag("input#ingredient_section[name=?]", "ingredient[section]")
    end
  end
end
