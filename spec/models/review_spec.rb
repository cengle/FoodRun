require 'spec_helper'

describe Review do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :review => "value for review",
      :rating => 1,
      :recipe_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Review.create!(@valid_attributes)
  end
end
