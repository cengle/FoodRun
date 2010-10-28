require 'spec_helper'

describe "/grocery_lists/index.html.erb" do
  include GroceryListsHelper

  before(:each) do
    assigns[:grocery_lists] = [
      stub_model(GroceryList),
      stub_model(GroceryList)
    ]
  end

  it "renders a list of grocery_lists" do
    render
  end
end
