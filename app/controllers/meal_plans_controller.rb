class MealPlansController < ApplicationController
  # GET /meal_plans
  # GET /meal_plans.xml
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

  # GET /meal_plans/new
  # GET /meal_plans/new.xml
  def new
    @meal_plan = MealPlan.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @meal_plan }
    end
  end

  # GET /meal_plans/1/edit
  def edit
    @meal_plan = MealPlan.find(params[:id])
  end

  # POST /meal_plans
  # POST /meal_plans.xml
  def create
    @meal_plan = MealPlan.new(params[:meal_plan])

    respond_to do |format|
      if @meal_plan.save
        format.html { redirect_to(@meal_plan, :notice => 'MealPlan was successfully created.') }
        format.xml  { render :xml => @meal_plan, :status => :created, :location => @meal_plan }
      else
        format.html { render :action => "new" }
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
end
