class UsersController < ApplicationController
  # GET /users
  # GET /users.xml
  
  layout 'recipes'
  
  
  def showMyRecipes
	user = User.find_by_id(params[:user])
	recipe_list = user.recipe_list
	@recipes = recipe_list.recipes
	respond_to do |format|
		format.html
		format.xml {render :xml => @recipes }
	end
  end
  
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = current_user
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])
	recipe_list = RecipeList.create
	@user.recipe_list = recipe_list
    respond_to do |format|
      if @user.save
        format.html { redirect_to(root_url, :notice => 'Registration successful') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = current_user

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(root_url, :notice => 'Successfully updated profile.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
  
  def delete_from_calendar
    year = params[:year]
	date = params[:date]
	month = params[:month]
	Calendar_recipe.delete_all(:month => month, :date => date, :year => year, :user_id => current_user.id, :recipe_id => params[:recipe_id])
	redirect_to :controller => 'calendar'
  end
end
