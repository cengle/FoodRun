require 'spec_helper'

describe "/reviews/show.html.erb" do
  include ReviewsHelper
  before(:each) do
    assigns[:review] = @review = stub_model(Review,
      :title => "value for title",
      :review => "value for review",
      :stars => 1,
      :recipe_id => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ title/)
    response.should have_text(/value\ for\ review/)
    response.should have_text(/1/)
    response.should have_text(/1/)
  end
end
