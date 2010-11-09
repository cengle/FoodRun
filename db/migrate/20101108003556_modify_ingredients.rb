class ModifyIngredients < ActiveRecord::Migration
  def self.up
    remove_column :ingredients, :number
    remove_column :ingredients, :unit
  end

  def self.down
    add_column :ingredients, :number, :int
    add_column :ingredients, :unit, :string
  end
end
