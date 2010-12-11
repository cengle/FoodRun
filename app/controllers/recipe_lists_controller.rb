class RecipeListsController < ApplicationController
  # GET /recipe_lists
  # GET /recipe_lists.xml
  
  layout 'recipes'
  
  
  def index
    @recipe_lists = RecipeList.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @recipe_lists }
    end
  end

  # GET /recipe_lists/1
  # GET /recipe_lists/1.xml
  def show
    user = User.find_by_id(params[:user])
	  @recipe_list = current_user.recipe_list
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @recipe_list }
    end
  end

  # GET /recipe_lists/new
  # GET /recipe_lists/new.xml
  def new
    @recipe_list = RecipeList.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @recipe_list }
    end
  end

  # GET /recipe_lists/1/edit
  def edit
    @recipe_list = RecipeList.find(params[:id])
  end

  # POST /recipe_lists
  # POST /recipe_lists.xml
  def create
    @recipe_list = RecipeList.new(params[:recipe_list])

    respond_to do |format|
      if @recipe_list.save
        format.html { redirect_to(@recipe_list, :notice => 'RecipeList was successfully created.') }
        format.xml  { render :xml => @recipe_list, :status => :created, :location => @recipe_list }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @recipe_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /recipe_lists/1
  # PUT /recipe_lists/1.xml
  def update
    #@recipe_list = RecipeList.find(params[:id])
  	@recipe_id = params[:id]
  	recipe_list = RecipeList.find(:first)
  	recipe = Recipe.find_by_id(@recipe_id)
  	recipe_lists = recipe.recipe_lists
  	#recipes = recipe_list.recipes
  	#recipes << Recipe.find_by_id(@recipe_id)
    respond_to do |format|
      if @recipe_list.update_attributes(params[:recipe_list])
        format.html { redirect_to(@recipe_list, :notice => 'Recipelist was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @recipe_list.errors, :status => :unprocessable_entity }
      end
    end
  end
	
  def update2
    #@recipe_list = RecipeList.find(params[:id])
	@recipe_id = params[:id]
	user = User.find_by_id(params[:user])
	recipe_list = user.recipe_list
	recipes = recipe_list.recipes
	recipes << Recipe.find_by_id(@recipe_id)
	recipe = Recipe.find_by_id(@recipe_id)
	flash[:notice] = recipe.title + ' was added to the recipe list.'
	
    respond_to do |format|
        format.html { redirect_to :controller => 'recipes', :action => 'show', :id => @recipe_id }
        format.xml  { head :ok }
    end
  end
  
  # returns a list of (super-)ingredients
  def groceryList
	user = User.find_by_id(params[:user])
	recipe_list = user.recipe_list
	recipes = recipe_list.recipes
  	@grocery_list = Array.new # list of ingredients
  	
  	recipes.each do |recipe| # for each recipe
  		recipe_ingredient_amounts = recipe.ingredient_amounts
  		
  		recipe_ingredient_amounts.each do |recipe_ingredient_amount| # for each ingredient in that recipe
                        recipe_ingredient = recipe_ingredient_amount.ingredient
  			ingredientExist = false
  			@grocery_list.each do |list_ingredient_amount| 	# for each ingredient in the grocery list 
                                list_ingredient = list_ingredient_amount.ingredient
                                if recipe_ingredient.name == list_ingredient.name and recipe_ingredient_amount.unit == list_ingredient_amount.unit
  					ingredientExist = true
  					list_ingredient_amount.number += recipe_ingredient_amount.number # no need to create new ingredient, just aggregate
  				end
  			end
  			
  			if not ingredientExist # current recipe_ingredient has not been added to grocery list
                                ingredient_amount = recipe_ingredient.ingredient_amounts.build
                                ingredient_amount.number = recipe_ingredient_amount.number
                                ingredient_amount.unit = recipe_ingredient_amount.unit
  				
  				@grocery_list << ingredient_amount
  			end
  		
  		end
  	end
  	
  	
  	# now return newly created grocery list
  	respond_to do |format|
  		format.html # groceryList.html.erb
      #format.xml  { render :layout => @recipes }
    end
  end

  # DELETE /recipe_lists/1
  # DELETE /recipe_lists/1.xml
  def destroy
    @recipe_list = RecipeList.find(params[:id])
    @recipe_list.destroy

    respond_to do |format|
      format.html { redirect_to(recipe_lists_url) }
      format.xml  { head :ok }
    end
  end

  # DELETE /recipe_lists/1/2
  def destroyRecipe
    @recipe_list = RecipeList.find(params[:id])
    @recipe_list.removeRecipe(params[:recipe_id])
    respond_to do |format|
      format.html { redirect_to @recipe_list}
      format.xml  { head :ok }
    end
  end
end
