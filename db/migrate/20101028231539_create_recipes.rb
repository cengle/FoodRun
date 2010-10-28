class CreateRecipes < ActiveRecord::Migration
  def self.up
    create_table :recipes do |t|
      t.string :title
      t.text :directions
      t.integer :completion_time
      t.integer :recipelist_id

      t.timestamps
    end
  end

  def self.down
    drop_table :recipes
  end
end
