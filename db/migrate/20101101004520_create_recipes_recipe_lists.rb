class CreateRecipesRecipeLists < ActiveRecord::Migration
  def self.up
    create_table :recipes_recipe_lists, :id = false do |t|
	  t.integer :recipe_id, :null => false
	  t.integer :student_id, :null => false
	end
  end

  def self.down
    drop_table :recipes_recipe_lists
  end
end
