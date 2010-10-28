require 'spec_helper'

describe "/grocery_lists/new.html.erb" do
  include GroceryListsHelper

  before(:each) do
    assigns[:grocery_list] = stub_model(GroceryList,
      :new_record? => true
    )
  end

  it "renders new grocery_list form" do
    render

    response.should have_tag("form[action=?][method=post]", grocery_lists_path) do
    end
  end
end
