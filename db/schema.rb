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

ActiveRecord::Schema.define(:version => 20110128165916) do

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.integer  "number"
    t.string   "section"
    t.integer  "department_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses_professors", :id => false, :force => true do |t|
    t.integer "course_id"
    t.integer "professor_id"
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
    t.integer  "course_id"
    t.integer  "professor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "upvotes",      :default => 0
    t.integer  "downvotes",    :default => 0
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

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "oauth2_uid",           :limit => 8
    t.string   "oauth2_token",         :limit => 149
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "twitter_handle"
    t.string   "twitter_oauth_token"
    t.string   "twitter_oauth_secret"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["oauth2_uid"], :name => "index_users_on_oauth2_uid", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["twitter_handle"], :name => "index_users_on_twitter_handle", :unique => true
  add_index "users", ["twitter_oauth_token", "twitter_oauth_secret"], :name => "index_users_on_twitter_oauth_token_and_twitter_oauth_secret"

end
