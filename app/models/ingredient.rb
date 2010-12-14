class Ingredient < ActiveRecord::Base
  has_many :ingredient_amounts
  has_many :recipes, :through => :ingredient_amounts
  
  def self.load_ingredient_database
    self.load_ingredients("public/ingredients.txt")
  end

  def self.load_ingredients(filename)
  File.open(filename).each do |line|
    l = line.split('~')
    code = l[1]
    name = l[3].downcase().titleize()
    section = nil
    if (l[1] =~ /^01[0-9]*$/)#Dairy & Eggs
      section = "Dairy"
    elsif (l[1] =~ /^02[0-9]*$/ or
           l[1] =~ /^04[0-9]*$/ or
           l[1] =~ /^12[0-9]*$/)
      section = "Ingredients"
    elsif (l[1] =~ /^09[0-9]*$/ or 
           l[1] =~ /^11[0-9]*$/ or
           l[1] =~ /^16[0-9]*$/)#Fruits and Vegetables
      section = "Produce"
    elsif (l[1] =~ /^05[0-9]*$/ or
           l[1] =~ /^07[0-9]*$/ or
           l[1] =~ /^10[0-9]*$/ or
           l[1] =~ /^13[0-9]*$/ or
           l[1] =~ /^15[0-9]*$/ or
           l[1] =~ /^17[0-9]*$/)
      section = "Meat and Seafood"
    elsif (l[1] =~ /^08[0-9]*$/ or
           l[1] =~ /^18[0-9]*$/ or
           l[1] =~ /^20[0-9]*$/ or
           l[1] =~ /^23[0-9]*$/)
      section = "Bakery, Grains, and Pastas"
    elsif (l[1] =~ /^35[0-9]*$/)
      section = "International"
    elsif (l[1] =~ /^19[0-9]*$/)
      section = "Miscellaneous"
    end
      if (section != nil)
        i = Ingredient.new(:name => name, :section => section)
        i.save
      end
    end
  end
end
