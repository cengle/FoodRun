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

end
