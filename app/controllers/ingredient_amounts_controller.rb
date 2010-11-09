class IngredientsRecipesController < ApplicationController
  # GET /ingredients_recipes
  # GET /ingredients_recipes.xml
  def index
    @ingredients_recipes = IngredientsRecipes.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ingredients_recipes }
    end
  end

  # GET /ingredients_recipes/1
  # GET /ingredients_recipes/1.xml
  def show
    @ingredients_recipes = IngredientsRecipes.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ingredients_recipes }
    end
  end

  # GET /ingredients_recipes/new
  # GET /ingredients_recipes/new.xml
  def new
    @ingredients_recipes = IngredientsRecipes.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ingredients_recipes }
    end
  end

  # GET /ingredients_recipes/1/edit
  def edit
    @ingredients_recipes = IngredientsRecipes.find(params[:id])
  end

  # POST /ingredients_recipes
  # POST /ingredients_recipes.xml
  def create
    @ingredients_recipes = IngredientsRecipes.new(params[:ingredients_recipes])

    respond_to do |format|
      if @ingredients_recipes.save
        format.html { redirect_to(@ingredients_recipes, :notice => 'IngredientsRecipes was successfully created.') }
        format.xml  { render :xml => @ingredients_recipes, :status => :created, :location => @ingredients_recipes }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ingredients_recipes.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ingredients_recipes/1
  # PUT /ingredients_recipes/1.xml
  def update
    @ingredients_recipes = IngredientsRecipes.find(params[:id])

    respond_to do |format|
      if @ingredients_recipes.update_attributes(params[:ingredients_recipes])
        format.html { redirect_to(@ingredients_recipes, :notice => 'IngredientsRecipes was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ingredients_recipes.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredients_recipes/1
  # DELETE /ingredients_recipes/1.xml
  def destroy
    @ingredients_recipes = IngredientsRecipes.find(params[:id])
    @ingredients_recipes.destroy

    respond_to do |format|
      format.html { redirect_to(ingredients_recipes_url) }
      format.xml  { head :ok }
    end
  end
end
