class AddMonthDateCalendarRecipes < ActiveRecord::Migration
  def self.up
    add_column :calendar_recipes, :month, :int
	add_column :calendar_recipes, :date, :int
  end

  def self.down
    remove_column :calendar_recipes, :month, :int
	remove_column :calendar_recipes, :date, :int
  end
end
