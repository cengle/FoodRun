class AddDescriptionToRecipe < ActiveRecord::Migration
  def self.up
    add_column :recipes, :description, :text
  end

  def self.down
    remove_column :recipes, :description
  end
end
