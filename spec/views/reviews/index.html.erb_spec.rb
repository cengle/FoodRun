require 'spec_helper'

describe "/reviews/index.html.erb" do
  include ReviewsHelper

  before(:each) do
    assigns[:reviews] = [
      stub_model(Review,
        :title => "value for title",
        :review => "value for review",
        :stars => 1,
        :recipe_id => 1
      ),
      stub_model(Review,
        :title => "value for title",
        :review => "value for review",
        :stars => 1,
        :recipe_id => 1
      )
    ]
  end

  it "renders a list of reviews" do
    render
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", "value for review".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
