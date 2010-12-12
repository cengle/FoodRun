class RecipesController < ApplicationController
  # GET /recipes
  # GET /recipes.xml
  
  def index
    @recipes = Recipe.paginate :page =>params[:page], :per_page => 5, :order => 'created_at DESC'
    #@recipes = Recipe.find(:all, :order=>'created_at DESC')
	#first_recipelist = RecipeList.create
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @recipes }
    end
  end

  def showMyRecipes
	user = User.find_by_id(params[:user])
	@recipes = user.recipes
	
	respond_to do |format|
		format.html
		format.xml {render :xml => @recipes }
	end
  end
  
  # GET /recipes/1
  # GET /recipes/1.xml
  def show
    @recipe = Recipe.find(params[:id])
	
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @recipe }
    end
  end

  # GET /recipes/new
  # GET /recipes/new.xml
  def new
    @recipe = Recipe.new
	25.times do 
		@recipe.ingredient_amounts.build
	end
    #@ingredient_name
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @recipe }
    end
  end

  # GET /recipes/1/edit
  def edit
    @recipe = Recipe.find(params[:id])
	10.times do 
		@recipe.ingredient_amounts.build
	end
  end

  # POST /recipes
  # POST /recipes.xml
  def create
    @recipe = Recipe.new(params[:recipe])
    #@ingredient = Ingredient.find_or_create_by_name(params[:ingredient_name])
    #@ingredient.ingredient_amounts << @recipe.ingredient_amounts
    respond_to do |format|
      if @recipe.save
        format.html { redirect_to(@recipe, :notice => 'Recipe was successfully created.') }
        format.xml  { render :xml => @recipe, :status => :created, :location => @recipe }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @recipe.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /recipes/1
  # PUT /recipes/1.xml
  def update
    @recipe = Recipe.find(params[:id])
    #@ingredient = Ingredient.find_or_create_by_name(params[:ingredient_name])
    #@ingredient.ingredient_amounts << @recipe.ingredient_amounts
    respond_to do |format|
      if @recipe.update_attributes(params[:recipe]) and @recipe.save
        format.html { redirect_to(@recipe, :notice => 'Recipe was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @recipe.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.xml
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to(recipes_url) }
      format.xml  { head :ok }
    end
  end
  
  def auto_complete_for_ingredient_amount_ingredient_name
  	params[:ingredient].name if params[:ingredient]
  end
  
  def search
  	flash.discard(:notice)
	@results = Recipe.find(:all, :conditions => ['title LIKE ?', "%#{params[:input]}%"])
	@input = params[:input]
	if (@results.empty?)
	  flash.now[:notice] = 'No results found.'
	end
	respond_to do |format|
      format.html # new.html.erb
    end
  end
end
