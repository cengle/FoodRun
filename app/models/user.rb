class User < ActiveRecord::Base
  acts_as_authentic
  has_one :recipe_list
end
