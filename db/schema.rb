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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101212035815) do

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.integer  "number"
    t.string   "section"
    t.integer  "department_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "professor_ratings", :force => true do |t|
    t.string   "comments"
    t.integer  "firstname"
    t.integer  "knowledge"
    t.integer  "engagement"
    t.integer  "curriculum"
    t.integer  "openness"
    t.integer  "officehelp"
    t.integer  "assignments"
    t.integer  "clarity"
    t.integer  "fun"
    t.integer  "caring"
    t.integer  "course_id"
    t.integer  "professor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "professors", :force => true do |t|
    t.integer  "department_id"
    t.string   "office_building"
    t.string   "office_room"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools", :force => true do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
