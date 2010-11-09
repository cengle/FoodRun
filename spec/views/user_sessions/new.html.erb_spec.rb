require 'spec_helper'

describe "/user_sessions/new.html.erb" do
  include UserSessionsHelper

  before(:each) do
    assigns[:user_session] = stub_model(UserSession,
      :new_record? => true,
      :username => "value for username",
      :password => "value for password"
    )
  end

  it "renders new user_session form" do
    render

    response.should have_tag("form[action=?][method=post]", user_sessions_path) do
      with_tag("input#user_session_username[name=?]", "user_session[username]")
      with_tag("input#user_session_password[name=?]", "user_session[password]")
    end
  end
end
