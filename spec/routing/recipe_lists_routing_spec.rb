require 'spec_helper'

describe RecipeListsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/recipe_lists" }.should route_to(:controller => "recipe_lists", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/recipe_lists/new" }.should route_to(:controller => "recipe_lists", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/recipe_lists/1" }.should route_to(:controller => "recipe_lists", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/recipe_lists/1/edit" }.should route_to(:controller => "recipe_lists", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/recipe_lists" }.should route_to(:controller => "recipe_lists", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/recipe_lists/1" }.should route_to(:controller => "recipe_lists", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/recipe_lists/1" }.should route_to(:controller => "recipe_lists", :action => "destroy", :id => "1") 
    end
  end
end
