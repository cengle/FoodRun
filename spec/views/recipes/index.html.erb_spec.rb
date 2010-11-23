require 'spec_helper'

describe "/recipes/index.html.erb" do
  include RecipesHelper

  before(:each) do
    assigns[:recipes] = [
      stub_model(Recipe,
        :title => "value for title",
        :directions => "value for directions",
        :completion_time => 1,
        :recipelist_id => 1
      ),
      stub_model(Recipe,
        :title => "value for title",
        :directions => "value for directions",
        :completion_time => 1,
        :recipelist_id => 1
      )
    ]
  end
=begin
  it "renders a list of recipes" do
    render
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", "value for directions".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
=end
end
