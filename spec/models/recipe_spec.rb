require 'spec_helper'

describe Recipe do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :directions => "value for directions",
      :completion_time => 1,
      :recipelist_id => 1,
	  :description => "this is a valid description"
    }
  end

  it "should create a new instance given valid attributes" do
    Recipe.create!(@valid_attributes)
  end
end
