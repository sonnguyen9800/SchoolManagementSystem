# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_04_26_053438) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coordinators", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "prerequisite"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "coordinator_id"
    t.integer "like"
    t.integer "dislike"
  end

  create_table "courses_categories", id: false, force: :cascade do |t|
    t.integer "course_id", null: false
    t.integer "category_id", null: false
    t.index ["course_id", "category_id"], name: "index_courses_categories_on_course_id_and_category_id", unique: true
  end

  create_table "courses_locations", id: false, force: :cascade do |t|
    t.integer "course_id", null: false
    t.integer "location_id", null: false
    t.index ["course_id", "location_id"], name: "index_courses_locations_on_course_id_and_location_id", unique: true
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
