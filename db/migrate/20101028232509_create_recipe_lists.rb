class CreateRecipeLists < ActiveRecord::Migration
  def self.up
    create_table :recipe_lists do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :recipe_lists
  end
end
