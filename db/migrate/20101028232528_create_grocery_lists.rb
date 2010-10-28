class CreateGroceryLists < ActiveRecord::Migration
  def self.up
    create_table :grocery_lists do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :grocery_lists
  end
end
