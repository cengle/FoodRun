class UserMealPlans < ActiveRecord::Migration
  def self.up
	add_column :meal_plans, :user_id, :int
  end

  def self.down
	remove_column :meal_plans, :user_id, :int
  end
end
