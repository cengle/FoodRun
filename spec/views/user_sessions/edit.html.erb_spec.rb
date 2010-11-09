require 'spec_helper'

describe "/user_sessions/edit.html.erb" do
  include UserSessionsHelper

  before(:each) do
    assigns[:user_session] = @user_session = stub_model(UserSession,
      :new_record? => false,
      :username => "value for username",
      :password => "value for password"
    )
  end

  it "renders the edit user_session form" do
    render

    response.should have_tag("form[action=#{user_session_path(@user_session)}][method=post]") do
      with_tag('input#user_session_username[name=?]', "user_session[username]")
      with_tag('input#user_session_password[name=?]', "user_session[password]")
    end
  end
end
