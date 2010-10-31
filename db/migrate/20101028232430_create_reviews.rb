class CreateReviews < ActiveRecord::Migration
  def self.up
    create_table :reviews do |t|
      t.string :title
      t.text :review
      t.integer :rating
      t.integer :recipe_id

      t.timestamps
    end
  end

  def self.down
    drop_table :reviews
  end
end
