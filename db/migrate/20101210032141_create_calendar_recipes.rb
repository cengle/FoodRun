class CreateCalendarRecipes < ActiveRecord::Migration
  def self.up
    create_table :calendar_recipes do |t|
	  t.integer :user_id
	  t.integer :recipe_id
	end
  end

  def self.down
    drop_table :calendar_recipes
  end
end
