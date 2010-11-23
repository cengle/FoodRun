require 'spec_helper'

describe "/ingredients/edit.html.erb" do
  include IngredientsHelper

  before(:each) do
    assigns[:ingredient] = @ingredient = stub_model(Ingredient,
      :new_record? => false,
      :name => "value for name",
      :section => "value for section",
    )
  end

  it "renders the edit ingredient form" do
    render

    response.should have_tag("form[action=#{ingredient_path(@ingredient)}][method=post]") do
      with_tag('input#ingredient_name[name=?]', "ingredient[name]")
      with_tag('input#ingredient_section[name=?]', "ingredient[section]")
    end
  end
end
