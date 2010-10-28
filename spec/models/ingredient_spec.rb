require 'spec_helper'

describe Ingredient do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :number => 1,
      :unit => "value for unit",
      :type => "value for type",
      :recipe_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Ingredient.create!(@valid_attributes)
  end
end
