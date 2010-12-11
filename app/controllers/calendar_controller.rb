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
	@event_strips = Event.event_strips_for_month(@shown_month, :conditions => 'name = "first_event"')
	  start_d, end_d = Event.get_start_and_end_dates(@shown_month) # optionally pass in @first_day_of_week
  @events = Event.events_for_date_range(start_d, end_d)
  @events << Event.new({:name => "third event", :start_at => Time.now, :end_at => Time.now})
  @event_strips = Event.create_event_strips(start_d, end_d, @events)


	#

  end
  
  def add_recipe
    
  end
end