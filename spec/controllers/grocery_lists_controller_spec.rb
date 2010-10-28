require 'spec_helper'

describe GroceryListsController do

  def mock_grocery_list(stubs={})
    @mock_grocery_list ||= mock_model(GroceryList, stubs)
  end

  describe "GET index" do
    it "assigns all grocery_lists as @grocery_lists" do
      GroceryList.stub(:find).with(:all).and_return([mock_grocery_list])
      get :index
      assigns[:grocery_lists].should == [mock_grocery_list]
    end
  end

  describe "GET show" do
    it "assigns the requested grocery_list as @grocery_list" do
      GroceryList.stub(:find).with("37").and_return(mock_grocery_list)
      get :show, :id => "37"
      assigns[:grocery_list].should equal(mock_grocery_list)
    end
  end

  describe "GET new" do
    it "assigns a new grocery_list as @grocery_list" do
      GroceryList.stub(:new).and_return(mock_grocery_list)
      get :new
      assigns[:grocery_list].should equal(mock_grocery_list)
    end
  end

  describe "GET edit" do
    it "assigns the requested grocery_list as @grocery_list" do
      GroceryList.stub(:find).with("37").and_return(mock_grocery_list)
      get :edit, :id => "37"
      assigns[:grocery_list].should equal(mock_grocery_list)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created grocery_list as @grocery_list" do
        GroceryList.stub(:new).with({'these' => 'params'}).and_return(mock_grocery_list(:save => true))
        post :create, :grocery_list => {:these => 'params'}
        assigns[:grocery_list].should equal(mock_grocery_list)
      end

      it "redirects to the created grocery_list" do
        GroceryList.stub(:new).and_return(mock_grocery_list(:save => true))
        post :create, :grocery_list => {}
        response.should redirect_to(grocery_list_url(mock_grocery_list))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved grocery_list as @grocery_list" do
        GroceryList.stub(:new).with({'these' => 'params'}).and_return(mock_grocery_list(:save => false))
        post :create, :grocery_list => {:these => 'params'}
        assigns[:grocery_list].should equal(mock_grocery_list)
      end

      it "re-renders the 'new' template" do
        GroceryList.stub(:new).and_return(mock_grocery_list(:save => false))
        post :create, :grocery_list => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested grocery_list" do
        GroceryList.should_receive(:find).with("37").and_return(mock_grocery_list)
        mock_grocery_list.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :grocery_list => {:these => 'params'}
      end

      it "assigns the requested grocery_list as @grocery_list" do
        GroceryList.stub(:find).and_return(mock_grocery_list(:update_attributes => true))
        put :update, :id => "1"
        assigns[:grocery_list].should equal(mock_grocery_list)
      end

      it "redirects to the grocery_list" do
        GroceryList.stub(:find).and_return(mock_grocery_list(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(grocery_list_url(mock_grocery_list))
      end
    end

    describe "with invalid params" do
      it "updates the requested grocery_list" do
        GroceryList.should_receive(:find).with("37").and_return(mock_grocery_list)
        mock_grocery_list.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :grocery_list => {:these => 'params'}
      end

      it "assigns the grocery_list as @grocery_list" do
        GroceryList.stub(:find).and_return(mock_grocery_list(:update_attributes => false))
        put :update, :id => "1"
        assigns[:grocery_list].should equal(mock_grocery_list)
      end

      it "re-renders the 'edit' template" do
        GroceryList.stub(:find).and_return(mock_grocery_list(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested grocery_list" do
      GroceryList.should_receive(:find).with("37").and_return(mock_grocery_list)
      mock_grocery_list.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the grocery_lists list" do
      GroceryList.stub(:find).and_return(mock_grocery_list(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(grocery_lists_url)
    end
  end

end
