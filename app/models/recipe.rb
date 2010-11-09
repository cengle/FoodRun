class Recipe < ActiveRecord::Base
  has_many :reviews, :dependent => :destroy
  has_many :ingredient_amounts, :dependent => :destroy
  has_many :ingredients, :through => :ingredient_amounts
  has_and_belongs_to_many :recipe_lists
  belongs_to :recipe_list
  accepts_nested_attributes_for :ingredient_amounts, :allow_destroy => true, :reject_if => :all_blank
end
