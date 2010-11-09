require 'spec_helper'

describe "/user_sessions/show.html.erb" do
  include UserSessionsHelper
  before(:each) do
    assigns[:user_session] = @user_session = stub_model(UserSession,
      :username => "value for username",
      :password => "value for password"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ username/)
    response.should have_text(/value\ for\ password/)
  end
end
