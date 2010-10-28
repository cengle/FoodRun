require 'spec_helper'

describe GroceryListsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/grocery_lists" }.should route_to(:controller => "grocery_lists", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/grocery_lists/new" }.should route_to(:controller => "grocery_lists", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/grocery_lists/1" }.should route_to(:controller => "grocery_lists", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/grocery_lists/1/edit" }.should route_to(:controller => "grocery_lists", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/grocery_lists" }.should route_to(:controller => "grocery_lists", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/grocery_lists/1" }.should route_to(:controller => "grocery_lists", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/grocery_lists/1" }.should route_to(:controller => "grocery_lists", :action => "destroy", :id => "1") 
    end
  end
end
