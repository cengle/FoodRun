# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101101223241) do

  create_table "grocery_lists", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ingredients", :force => true do |t|
    t.string   "name"
    t.integer  "number"
    t.string   "unit"
    t.integer  "recipe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "section"
  end

  create_table "recipe_lists", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipe_lists_recipes", :id => false, :force => true do |t|
    t.integer "recipe_id",      :null => false
    t.integer "recipe_list_id", :null => false
  end

  create_table "recipes", :force => true do |t|
    t.string   "title"
    t.text     "directions"
    t.integer  "completion_time"
    t.integer  "recipelist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipes_recipe_lists", :id => false, :force => true do |t|
    t.integer "recipe_id",  :null => false
    t.integer "student_id", :null => false
  end

  create_table "reviews", :force => true do |t|
    t.string   "title"
    t.text     "review"
    t.integer  "rating"
    t.integer  "recipe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
