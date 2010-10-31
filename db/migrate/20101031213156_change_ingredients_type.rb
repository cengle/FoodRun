class ChangeIngredientsType < ActiveRecord::Migration
  def self.up
    add_column :ingredients, :section, :string
    remove_column :ingredients, :type
  end

  def self.down
    add_column :ingredients, :type, :string
    remove_column :ingredients, :section
  end
end
