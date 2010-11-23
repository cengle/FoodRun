require 'spec_helper'

describe "/ingredients/show.html.erb" do
  include IngredientsHelper
  before(:each) do
    assigns[:ingredient] = @ingredient = stub_model(Ingredient,
      :name => "value for name",
      :section => "value for section",
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ section/)
  end
end
