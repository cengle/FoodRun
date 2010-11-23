require 'spec_helper'

describe "/ingredients/index.html.erb" do
  include IngredientsHelper

  before(:each) do
    assigns[:ingredients] = [
      stub_model(Ingredient,
        :name => "value for name",
        :section => "value for section",
      ),
      stub_model(Ingredient,
        :name => "value for name",
        :section => "value for section",
      )
    ]
  end

  it "renders a list of ingredients" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for section".to_s, 2)
  end
end
