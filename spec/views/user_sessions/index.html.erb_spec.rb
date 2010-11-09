require 'spec_helper'

describe "/user_sessions/index.html.erb" do
  include UserSessionsHelper

  before(:each) do
    assigns[:user_sessions] = [
      stub_model(UserSession,
        :username => "value for username",
        :password => "value for password"
      ),
      stub_model(UserSession,
        :username => "value for username",
        :password => "value for password"
      )
    ]
  end

  it "renders a list of user_sessions" do
    render
    response.should have_tag("tr>td", "value for username".to_s, 2)
    response.should have_tag("tr>td", "value for password".to_s, 2)
  end
end
