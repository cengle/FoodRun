class Recipe < ActiveRecord::Base
  has_many :reviews, :dependent => :destroy
  has_many :ingredient_amounts, :dependent => :destroy
  has_many :ingredients, :through => :ingredient_amounts
  has_and_belongs_to_many :recipe_lists
  belongs_to :recipe_list
  belongs_to :user
  accepts_nested_attributes_for :ingredient_amounts, :allow_destroy => true, :reject_if => :all_blank
  
  has_attached_file :photo
  
  validates_length_of :title, :minimum => 2
  validates_length_of :description, :minimum => 10
  validates_length_of :description, :maximum => 100
  
  def average_rating
    revs = self.reviews
    sum = 0.0
    revs.each do |rev|
      sum += rev.rating
    end
    return sum/[revs.size,1].max
  end
end
