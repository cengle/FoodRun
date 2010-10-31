class Recipe < ActiveRecord::Base
  has_many :reviews, :dependent => :destroy
  has_many :ingredients, :dependent => :destroy
  belongs_to :recipe_list
  accepts_nested_attributes_for :ingredients, :allow_destroy => true, :reject_if => :all_blank
end
