class Recipe < ActiveRecord::Base
  has_many :reviews, :dependent => :destroy
  has_many :ingredients, :dependent => :destroy
  belongs_to :recipe_list
end
