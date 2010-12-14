class MealPlansController < ApplicationController
  # GET /meal_plans
  # GET /meal_plans.xml
  
  layout 'recipes'
  
  def index
    @meal_plans = MealPlan.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @meal_plans }
    end
  end

  # GET /meal_plans/1
  # GET /meal_plans/1.xml
  def show
    @meal_plan = MealPlan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @meal_plan }
    end
  end
  
  def showMyMealPlans
  	@meal_plans = current_user.meal_plans
  		
	respond_to do |format|
		format.html
		format.xml {render :xml => @meal_plans }
	end
  end
  

  # GET /meal_plans/new
  # GET /meal_plans/new.xml
  def new
    @meal_plan = MealPlan.find(params[:id])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @meal_plan }
    end
  end 
  
  def newHelper
  	@meal_plan = MealPlan.new(:user_id => current_user.id, :name => "Default Meal Plan Name", 
  					:description => "Enter Meal Plan Description")
  	@meal_plan.user_id = current_user.id
  	for recipe in @meal_plan.user.recipe_list.recipes
    		@meal_plan.recipes << recipe
    	end
    	@meal_plan.number = @meal_plan.recipes.size
    	if @meal_plan.save
    		redirect_to :action => 'new', :id => @meal_plan.id
    	else
    		redirect_to :controller => 'calendar', :action => 'index'
    	end
  end

  # GET /meal_plans/1/edit
  def edit
    @meal_plan = MealPlan.find(params[:id])
  end
  
  # POST /meal_plans
  # POST /meal_plans.xml
  def create    
    @meal_plan = MealPlan.find(params[:id])
    
    respond_to do |format|
    	if @meal_plan.update_attributes(params[:meal_plan])
    		redirect_to(@meal_plan, :notice => 'MealPlan was successfully created.')
    	else
		format.html { render :controller => 'calendar', :action => 'index' }
		format.xml  { render :xml => @meal_plan.errors, :status => :unprocessable_entity }
		
    	end
    end
  end

  # PUT /meal_plans/1
  # PUT /meal_plans/1.xml
  def update
    @meal_plan = MealPlan.find(params[:id])

    respond_to do |format|
      if @meal_plan.update_attributes(params[:meal_plan])
        format.html { redirect_to(@meal_plan, :notice => 'MealPlan was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @meal_plan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /meal_plans/1
  # DELETE /meal_plans/1.xml
  def destroy
    @meal_plan = MealPlan.find(params[:id])
    @meal_plan.destroy

    respond_to do |format|
      format.html { redirect_to(meal_plans_url) }
      format.xml  { head :ok }
    end
  end
  
  def search
	@results = MealPlan.find(:all, :conditions => ['lower(name) LIKE ?', "%#{params[:input].downcase()}%"])
	@input = params[:input]
	if (@results.empty?)
	  flash.now[:notice] = 'No results found.'
	end
	
	respond_to do |format|
      		format.html # new.html.erb
   	end
  end
  
  def removeRecipe
  	@meal_plan = MealPlan.find(params[:id])
  	recipe_id = params[:recipe_id]
  	@meal_plan.removeRecipe(recipe_id)
  	@meal_plan.update_attributes(:number => @meal_plan.recipes.size)
	redirect_to :action => 'new', :id => @meal_plan.id
  end
  
  
  def removeRecipeFromExisting
  	meal_plan_id = params[:id]
 	recipe_id = params[:recipe_id]
  	@meal_plan = MealPlan.find(params[:id])
  	@meal_plan.removeRecipe(recipe_id)  		
  	@meal_plan.update_attributes(:number => @meal_plan.recipes.size)
  	redirect_to :action => 'show', :id => meal_plan_id
  end
    
  
end
