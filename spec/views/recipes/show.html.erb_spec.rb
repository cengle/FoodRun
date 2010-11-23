require 'spec_helper'

describe "/recipes/show.html.erb" do
  include RecipesHelper
  before(:each) do
    assigns[:recipe] = @recipe = stub_model(Recipe,
      :title => "value for title",
      :directions => "value for directions",
      :completion_time => 1,
      :recipelist_id => 1
    )
  end
=begin
  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ title/)
    response.should have_text(/value\ for\ directions/)
    response.should have_text(/1/)
    response.should have_text(/1/)
  end
=end
end
