# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  before_filter :load_sidebar
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  helper_method :current_user
  def load_sidebar
    @featured_recipes = Recipe.find :all, :order => :title, :limit => 8
    @top_recipes = Recipe.find(:all, :limit => 4).sort!{|r1,r2|r2.average_rating <=> r1.average_rating}
  end
  private
  helper_method :current_user

	private

	def current_user_session
	  return @current_user_session if defined?(@current_user_session)
	  @current_user_session = UserSession.find
	end

	def current_user
	  return @current_user if defined?(@current_user)
	  @current_user = current_user_session && current_user_session.record
	end

  layout 'recipes'
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
