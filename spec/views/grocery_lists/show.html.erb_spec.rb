require 'spec_helper'

describe "/grocery_lists/show.html.erb" do
  include GroceryListsHelper
  before(:each) do
    assigns[:grocery_list] = @grocery_list = stub_model(GroceryList)
  end

  it "renders attributes in <p>" do
    render
  end
end
