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

ActiveRecord::Schema.define(:version => 20120819225808) do

  create_table "users", :primary_key => "user_id", :force => true do |t|
    t.string    "first_name",    :limit => 63,  :default => "", :null => false
    t.string    "last_name",     :limit => 63,  :default => "", :null => false
    t.string    "email",         :limit => 127,                 :null => false
    t.string    "password_hash", :limit => 63,                  :null => false
    t.integer   "created_by",                   :default => 0,  :null => false
    t.timestamp "created_at",                                   :null => false
    t.integer   "updated_by",                   :default => 0,  :null => false
    t.timestamp "updated_at",                                   :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
