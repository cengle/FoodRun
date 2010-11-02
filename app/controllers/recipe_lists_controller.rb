class RecipeListsController < ApplicationController
  # GET /recipe_lists
  # GET /recipe_lists.xml
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
    @recipe_list = RecipeList.find(:first)
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
	recipe_list = RecipeList.find(:first)
	recipe = Recipe.find_by_id(@recipe_id)
	#recipe_lists = recipe.recipe_lists
	recipes = recipe_list.recipes
	recipes << Recipe.find_by_id(@recipe_id)
	flash[:notice] = recipe.title + ' was added to the recipe list.'
    respond_to do |format|
        format.html { redirect_to :controller => 'recipes', :action => 'show', :id => @recipe_id }
        format.xml  { head :ok }
    end
  end
  
  # returns a list of (super-)ingredients
  def groceryList
  	recipe_list = RecipeList.find(:first).recipes
  	@grocery_list = Array.new # list of ingredients
  	
  	recipe_list.each do |recipe| # for each recipe
  		recipe_ingredients = recipe.ingredients
  		
  		recipe_ingredients.each do |recipe_ingredient| # for each ingredient in that recipe
  		
  			ingredientExist = false
  			@grocery_list.each do |list_ingredient| 	# for each ingredient in the grocery list 
  				if recipe_ingredient.name == list_ingredient.name and recipe_ingredient.unit == list_ingredient.unit
  					ingredientExist = 1
  					list_ingredient.number += recipe_ingredient.number # no need to create new ingredient, just aggregate
  				end
  			end
  			
  			if not ingredientExist # current recipe_ingredient has not been added to grocery list
  				ingredient = Ingredient.new(:name => recipe_ingredient.name, :number => recipe_ingredient.number,
  							:unit => recipe_ingredient.unit, :section => recipe_ingredient.section)
  				
  				@grocery_list << ingredient
  			end
  			
  		end
  	end
  	
  	
  	# now return newly created grocery list
  	respond_to do |format|
  		format.html # groceryList.html.erb
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
end
