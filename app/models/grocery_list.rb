class GroceryList < ActiveRecord::Base
  has_many :ingredients, :dependent => :destroy
end
