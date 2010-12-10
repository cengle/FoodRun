class CreateMealPlans < ActiveRecord::Migration
  def self.up
    create_table :meal_plans do |t|
      t.string :name
      t.int :number

      t.timestamps
    end
  end

  def self.down
    drop_table :meal_plans
  end
end
