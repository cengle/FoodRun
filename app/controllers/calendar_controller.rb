class CalendarController < ApplicationController
  before_filter :load_sidebar
  def load_sidebar
    @recipes = current_user.recipe_list.recipes
    @recipe_list = current_user.recipe_list
  end
  
  layout 'calendar'
  
  def index
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i

    @shown_month = Date.civil(@year, @month)

    #@event_strips = Event.event_strips_for_month(@shown_month)
	#@event_strips = Event.event_strips_for_month(@shown_month, :conditions => 'name = "first_event"')
	  start_d, end_d = Event.get_start_and_end_dates(@shown_month) # optionally pass in @first_day_of_week
  

  @recipes_for_user = Calendar_recipe.find_all_by_user_id(current_user.id)
  @events = Array.new
  event_id_counter = 0
  @recipes_for_user.each do |calendar_recipe|
    recipe_id = calendar_recipe.recipe_id
	recipe = Recipe.find_by_id(recipe_id)
	recipe_date = Date.civil(calendar_recipe.year, calendar_recipe.month, calendar_recipe.date)
	tempEvent = Event.new({:name => recipe.title, :start_at => recipe_date, :end_at => recipe_date})
	tempEvent.id = event_id_counter
	@events << tempEvent
	
	event_id_counter = event_id_counter + 1
  end
  #@events = Event.events_for_date_range(start_d, end_d)
  #@events << Event.new({:name => "third event", :start_at => Time.now, :end_at => Time.now})
  @event_strips = Event.create_event_strips(start_d, end_d, @events)

  end
  
  def add_recipe
    # year, month date
    year = params[:event][:"recipe_date(1i)"].to_i
	date = params[:event][:"recipe_date(3i)"].to_i
	month = params[:event][:"recipe_date(2i)"].to_i
    Calendar_recipe.create({:user_id => current_user.id, :recipe_id => params[:event][:recipe_id], :month => month, :date => date, :year => year})
	redirect_to :action => 'index'
  end
  
  def delete_from_calendar
    year = params[:event][:"recipe_date(1i)"].to_i
	date = params[:event][:"recipe_date(3i)"].to_i
	month = params[:event][:"recipe_date(2i)"].to_i
	Calendar_recipe.delete_all(:month => month, :date => date, :year => year, :user_id => current_user.id)
	redirect_to :action => 'index'
  end
end