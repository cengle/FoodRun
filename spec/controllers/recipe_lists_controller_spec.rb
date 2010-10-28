require 'spec_helper'

describe RecipeListsController do

  def mock_recipe_list(stubs={})
    @mock_recipe_list ||= mock_model(RecipeList, stubs)
  end

  describe "GET index" do
    it "assigns all recipe_lists as @recipe_lists" do
      RecipeList.stub(:find).with(:all).and_return([mock_recipe_list])
      get :index
      assigns[:recipe_lists].should == [mock_recipe_list]
    end
  end

  describe "GET show" do
    it "assigns the requested recipe_list as @recipe_list" do
      RecipeList.stub(:find).with("37").and_return(mock_recipe_list)
      get :show, :id => "37"
      assigns[:recipe_list].should equal(mock_recipe_list)
    end
  end

  describe "GET new" do
    it "assigns a new recipe_list as @recipe_list" do
      RecipeList.stub(:new).and_return(mock_recipe_list)
      get :new
      assigns[:recipe_list].should equal(mock_recipe_list)
    end
  end

  describe "GET edit" do
    it "assigns the requested recipe_list as @recipe_list" do
      RecipeList.stub(:find).with("37").and_return(mock_recipe_list)
      get :edit, :id => "37"
      assigns[:recipe_list].should equal(mock_recipe_list)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created recipe_list as @recipe_list" do
        RecipeList.stub(:new).with({'these' => 'params'}).and_return(mock_recipe_list(:save => true))
        post :create, :recipe_list => {:these => 'params'}
        assigns[:recipe_list].should equal(mock_recipe_list)
      end

      it "redirects to the created recipe_list" do
        RecipeList.stub(:new).and_return(mock_recipe_list(:save => true))
        post :create, :recipe_list => {}
        response.should redirect_to(recipe_list_url(mock_recipe_list))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved recipe_list as @recipe_list" do
        RecipeList.stub(:new).with({'these' => 'params'}).and_return(mock_recipe_list(:save => false))
        post :create, :recipe_list => {:these => 'params'}
        assigns[:recipe_list].should equal(mock_recipe_list)
      end

      it "re-renders the 'new' template" do
        RecipeList.stub(:new).and_return(mock_recipe_list(:save => false))
        post :create, :recipe_list => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested recipe_list" do
        RecipeList.should_receive(:find).with("37").and_return(mock_recipe_list)
        mock_recipe_list.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :recipe_list => {:these => 'params'}
      end

      it "assigns the requested recipe_list as @recipe_list" do
        RecipeList.stub(:find).and_return(mock_recipe_list(:update_attributes => true))
        put :update, :id => "1"
        assigns[:recipe_list].should equal(mock_recipe_list)
      end

      it "redirects to the recipe_list" do
        RecipeList.stub(:find).and_return(mock_recipe_list(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(recipe_list_url(mock_recipe_list))
      end
    end

    describe "with invalid params" do
      it "updates the requested recipe_list" do
        RecipeList.should_receive(:find).with("37").and_return(mock_recipe_list)
        mock_recipe_list.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :recipe_list => {:these => 'params'}
      end

      it "assigns the recipe_list as @recipe_list" do
        RecipeList.stub(:find).and_return(mock_recipe_list(:update_attributes => false))
        put :update, :id => "1"
        assigns[:recipe_list].should equal(mock_recipe_list)
      end

      it "re-renders the 'edit' template" do
        RecipeList.stub(:find).and_return(mock_recipe_list(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested recipe_list" do
      RecipeList.should_receive(:find).with("37").and_return(mock_recipe_list)
      mock_recipe_list.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the recipe_lists list" do
      RecipeList.stub(:find).and_return(mock_recipe_list(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(recipe_lists_url)
    end
  end

end
