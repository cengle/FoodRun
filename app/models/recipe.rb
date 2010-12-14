class Recipe < ActiveRecord::Base
  has_many :reviews, :dependent => :destroy#, :order => "created_at DESC", :limit => 5
  has_many :ingredient_amounts, :dependent => :destroy
  has_many :ingredients, :through => :ingredient_amounts
  has_and_belongs_to_many :recipe_lists
  belongs_to :recipe_list
  has_and_belongs_to_many :meal_plans
  belongs_to :user
  accepts_nested_attributes_for :ingredient_amounts, :allow_destroy => true, :reject_if => :all_blank
  
  has_attached_file :photo,
  :storage => :s3, 
      :s3_credentials => "#{RAILS_ROOT}/config/amazon_s3.yml", 
      :path => "/:style/:filename"
  
  validates_length_of :title, :minimum => 2
  validates_length_of :description, :minimum => 10
  validates_length_of :description, :maximum => 100
  
  def build_ingredient_amounts
	20.times do
		self.ingredient_amounts.build
	end
  end
  def average_rating
    revs = self.reviews
    sum = 0.0
    revs.each do |rev|
      sum += rev.rating
    end
    return (sum/[revs.size,1].max).round(1)
  end
end
