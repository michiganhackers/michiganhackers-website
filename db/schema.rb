# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20120824001928) do

  create_table "events", :primary_key => "event_id", :force => true do |t|
    t.string    "name",         :limit => 127,                :null => false
    t.text      "description",                                :null => false
    t.string    "location",     :limit => 127,                :null => false
    t.datetime  "start_time",                                 :null => false
    t.datetime  "end_time"
    t.string    "facebook_eid", :limit => 127
    t.float     "position_lat"
    t.float     "position_lng"
    t.timestamp "created_at",                                 :null => false
    t.integer   "created_by",                  :default => 0, :null => false
    t.timestamp "updated_at",                                 :null => false
    t.integer   "updated_by",                  :default => 0, :null => false
  end

  create_table "user_types", :primary_key => "user_type_id", :force => true do |t|
    t.string    "type_name",  :limit => 63,                :null => false
    t.timestamp "created_at",                              :null => false
    t.integer   "created_by",               :default => 0, :null => false
    t.timestamp "updated_at",                              :null => false
    t.integer   "updated_by",               :default => 0, :null => false
  end

  add_index "user_types", ["type_name"], :name => "index_user_types_on_type_name", :unique => true

  create_table "users", :primary_key => "user_id", :force => true do |t|
    t.integer   "user_type_id",                                 :null => false
    t.string    "first_name",    :limit => 63,  :default => "", :null => false
    t.string    "last_name",     :limit => 63,  :default => "", :null => false
    t.string    "email",         :limit => 127,                 :null => false
    t.string    "password_hash", :limit => 63,                  :null => false
    t.timestamp "created_at",                                   :null => false
    t.integer   "created_by",                   :default => 0,  :null => false
    t.timestamp "updated_at",                                   :null => false
    t.integer   "updated_by",                   :default => 0,  :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
