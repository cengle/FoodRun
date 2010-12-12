module CalendarHelper
  def month_link(month_date)
    link_to(I18n.localize(month_date, :format => "%B"), {:month => month_date.month, :year => month_date.year})
  end
  
  # custom options for this calendar
  def event_calendar_opts
    { 
      :year => @year,
      :month => @month,
      :event_strips => @event_strips,
      :month_name_text => I18n.localize(@shown_month, :format => "%B %Y"),
      :previous_month_text => "<< " + month_link(@shown_month.last_month),
      :next_month_text => month_link(@shown_month.next_month) + " >>",
    }
  end

  def event_calendar
    # args is an argument hash containing :event, :day, and :options
	calendar event_calendar_opts do |args|
      event = args[:event]
	  recipe = Recipe.find_by_title(event.name)
	  recipe_id = recipe.id
	  blah = 'blah blah'
      html = %(<a href="/recipes/#{recipe_id}" title="#{h(event.name)}">#{h(blah)}</a>)
      html
    end
  end
end