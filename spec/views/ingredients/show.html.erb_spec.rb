require 'spec_helper'

describe "/ingredients/show.html.erb" do
  include IngredientsHelper
  before(:each) do
    assigns[:ingredient] = @ingredient = stub_model(Ingredient,
      :name => "value for name",
      :number => 1,
      :unit => "value for unit",
      :section => "value for section",
      :recipe_id => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ unit/)
    response.should have_text(/value\ for\ section/)
    response.should have_text(/1/)
  end
end
