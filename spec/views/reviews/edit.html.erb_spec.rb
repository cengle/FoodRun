require 'spec_helper'

describe "/reviews/edit.html.erb" do
  include ReviewsHelper

  before(:each) do
    assigns[:review] = @review = stub_model(Review,
      :new_record? => false,
      :title => "value for title",
      :review => "value for review",
      :rating => 1,
      :recipe_id => 1
    )
  end

  it "renders the edit review form" do
    render

    response.should have_tag("form[action=#{review_path(@review)}][method=post]") do
      with_tag('input#review_title[name=?]', "review[title]")
      with_tag('textarea#review_review[name=?]', "review[review]")
      with_tag('input#review_rating[name=?]', "review[rating]")
      with_tag('input#review_recipe_id[name=?]', "review[recipe_id]")
    end
  end
end
