class RecipesController < ApplicationController
  # GET /recipes
  # GET /recipes.xml
  def index
    @recipes = Recipe.find(:all, :order=>'created_at DESC')
	#first_recipelist = RecipeList.create
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @recipes }
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
    @recipe.ingredient_amounts.build
    @ingredient_name
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @recipe }
    end
  end

  # GET /recipes/1/edit
  def edit
    @recipe = Recipe.find(params[:id])
    @ingredient_name = @recipe.ingredients[0].name
  end

  # POST /recipes
  # POST /recipes.xml
  def create
    @recipe = Recipe.new(params[:recipe])
    @ingredient = Ingredient.find_or_create_by_name(params[:ingredient_name])
    @ingredient.ingredient_amounts << @recipe.ingredient_amounts
    respond_to do |format|
      if @recipe.save and @ingredient.save
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
    @ingredient = Ingredient.find_or_create_by_name(params[:ingredient_name])
    @ingredient.ingredient_amounts << @recipe.ingredient_amounts
    respond_to do |format|
      if @recipe.update_attributes(params[:recipe])
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
  
  def search
	#@results = Recipe.find(:all, :conditions => {:title => params[:input]}) <== OLD SEARCH
	@results = Recipe.find(:all, :conditions => ['title LIKE ?', "%#{params[:input]}%"])

	if (@results.empty?)
	  flash[:notice] = 'No results found.'
	end
	respond_to do |format|
      format.html # new.html.erb
    end
  end
end
