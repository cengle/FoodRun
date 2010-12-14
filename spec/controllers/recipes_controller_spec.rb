require 'spec_helper'

describe RecipesController do


  def mock_recipe(stubs={})
    @mock_recipe ||= mock_model(Recipe, stubs)
  end

  before(:each) do
    controller.stub!(:load_sidebar)
  end


=begin
  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created recipe as @recipe" do
        Recipe.stub(:new).with({'these' => 'params'}).and_return(mock_recipe(:save => true))
        post :create, :recipe => {:these => 'params'}
        assigns[:recipe].should equal(mock_recipe)
      end

      it "redirects to the created recipe" do
        Recipe.stub(:new).and_return(mock_recipe(:save => true))
        post :create, :recipe => {}
        response.should redirect_to(recipe_url(mock_recipe))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved recipe as @recipe" do
        Recipe.stub(:new).with({'these' => 'params'}).and_return(mock_recipe(:save => false))
        post :create, :recipe => {:these => 'params'}
        assigns[:recipe].should equal(mock_recipe)
      end

      it "re-renders the 'new' template" do
        Recipe.stub(:new).and_return(mock_recipe(:save => false))
        post :create, :recipe => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested recipe" do
        Recipe.should_receive(:find).with("37").and_return(mock_recipe)
        mock_recipe.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :recipe => {:these => 'params'}
      end

      it "assigns the requested recipe as @recipe" do
        Recipe.stub(:find).and_return(mock_recipe(:update_attributes => true))
        put :update, :id => "1"
        assigns[:recipe].should equal(mock_recipe)
      end

      it "redirects to the recipe" do
        Recipe.stub(:find).and_return(mock_recipe(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(recipe_url(mock_recipe))
      end
    end

    describe "with invalid params" do
      

      it "re-renders the 'edit' template" do
        Recipe.stub(:find).and_return(mock_recipe(:update_attributes => false))
        put :update, :id => 1
        response.should render_template('edit')
      end
    end

  end
=end
  describe "DELETE destroy" do
    it "destroys the requested recipe" do
      Recipe.should_receive(:find).with("37").and_return(mock_recipe)
      mock_recipe.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the recipes list" do
      Recipe.stub(:find).and_return(mock_recipe(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(recipes_url)
    end
  end

  describe "search" do
    it "should assign the correct results to @results" do
	  Recipe.stub(:find).and_return([mock_recipe])
	  get :search
	  assigns[:results].should == [mock_recipe]
	end
	
	
  end
  
end
