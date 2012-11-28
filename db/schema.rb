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

ActiveRecord::Schema.define(:version => 20121128043010) do

  create_table "cseducation_answers", :primary_key => "cseducation_answer_id", :force => true do |t|
    t.integer   "value",                                    :null => false
    t.string    "uniqname",   :limit => 15, :default => "", :null => false
    t.string    "qid",        :limit => 63, :default => "", :null => false
    t.timestamp "created_at",                               :null => false
    t.integer   "created_by",               :default => 0,  :null => false
    t.timestamp "updated_at",                               :null => false
    t.integer   "updated_by",               :default => 0,  :null => false
  end

  create_table "event_sign_ins", :primary_key => "event_sign_in_id", :force => true do |t|
    t.integer   "user_id",                                 :null => false
    t.string    "eid",        :limit => 31,                :null => false
    t.timestamp "created_at",                              :null => false
    t.integer   "created_by",               :default => 0, :null => false
    t.timestamp "updated_at",                              :null => false
    t.integer   "updated_by",               :default => 0, :null => false
  end

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

  create_table "user_details", :id => false, :force => true do |t|
    t.integer   "user_id",                                       :null => false
    t.string    "concentration",   :limit => 127,                :null => false
    t.date      "graduation_date",                               :null => false
    t.string    "github_handle",   :limit => 63
    t.string    "personal_url",    :limit => 127
    t.timestamp "created_at",                                    :null => false
    t.integer   "created_by",                     :default => 0, :null => false
    t.timestamp "updated_at",                                    :null => false
    t.integer   "updated_by",                     :default => 0, :null => false
  end

  add_index "user_details", ["user_id"], :name => "index_user_details_on_user_id", :unique => true

  create_table "user_types", :primary_key => "user_type_id", :force => true do |t|
    t.string    "type_name",  :limit => 63,                :null => false
    t.timestamp "created_at",                              :null => false
    t.integer   "created_by",               :default => 0, :null => false
    t.timestamp "updated_at",                              :null => false
    t.integer   "updated_by",               :default => 0, :null => false
  end

  add_index "user_types", ["type_name"], :name => "index_user_types_on_type_name", :unique => true

  create_table "users", :primary_key => "user_id", :force => true do |t|
    t.integer   "user_type_id",                                        :null => false
    t.string    "first_name",        :limit => 63,  :default => "",    :null => false
    t.string    "last_name",         :limit => 63,  :default => "",    :null => false
    t.string    "email",             :limit => 127,                    :null => false
    t.string    "password_hash",     :limit => 63,                     :null => false
    t.string    "confirmation_hash", :limit => 63
    t.boolean   "is_active",                        :default => false, :null => false
    t.boolean   "reg_email_sent",                   :default => false, :null => false
    t.boolean   "reset_password",                   :default => false, :null => false
    t.datetime  "last_login"
    t.timestamp "created_at",                                          :null => false
    t.integer   "created_by",                       :default => 0,     :null => false
    t.timestamp "updated_at",                                          :null => false
    t.integer   "updated_by",                       :default => 0,     :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

  create_table "wiki_page_versions", :force => true do |t|
    t.integer  "page_id",    :null => false
    t.integer  "updator_id"
    t.integer  "number"
    t.string   "comment"
    t.string   "path"
    t.string   "title"
    t.text     "content"
    t.datetime "updated_at"
  end

  add_index "wiki_page_versions", ["page_id"], :name => "index_wiki_page_versions_on_page_id"
  add_index "wiki_page_versions", ["updator_id"], :name => "index_wiki_page_versions_on_updator_id"

  create_table "wiki_pages", :force => true do |t|
    t.integer  "creator_id"
    t.integer  "updator_id"
    t.string   "path"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "wiki_pages", ["creator_id"], :name => "index_wiki_pages_on_creator_id"
  add_index "wiki_pages", ["path"], :name => "index_wiki_pages_on_path", :unique => true

end
