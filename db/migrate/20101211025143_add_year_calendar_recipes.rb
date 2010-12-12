class AddYearCalendarRecipes < ActiveRecord::Migration
  def self.up
    add_column :calendar_recipes, :year, :int
  end

  def self.down
    remove_column :calendar_recipes, :year, :int
  end
end
