require 'spec_helper'

describe "/grocery_lists/edit.html.erb" do
  include GroceryListsHelper

  before(:each) do
    assigns[:grocery_list] = @grocery_list = stub_model(GroceryList,
      :new_record? => false
    )
  end

  it "renders the edit grocery_list form" do
    render

    response.should have_tag("form[action=#{grocery_list_path(@grocery_list)}][method=post]") do
    end
  end
end
