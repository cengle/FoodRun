class AddDescriptionToMealPlan < ActiveRecord::Migration
  def self.up
	add_column :meal_plans, :description, :text
  end

  def self.down
	remove_column :meal_plans, :description
  end
end
