require 'spec_helper'

describe Ingredient do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :type => "value for type",
    }
  end

  it "should create a new instance given valid attributes" do
    Ingredient.create!(@valid_attributes)
  end
end
