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

ActiveRecord::Schema.define(:version => 20120228211346) do

  create_table "prop_changes", :force => true do |t|
    t.string   "name"
    t.date     "date"
    t.string   "phone"
    t.string   "organization"
    t.string   "email"
    t.string   "address"
    t.string   "city"
    t.string   "zip"
    t.string   "com_rec"
    t.text     "comment"
    t.text     "support"
    t.string   "signature"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "rop_email"
    t.integer  "state_id"
    t.integer  "standard_id"
    t.integer  "standard_area_id"
  end

  add_index "prop_changes", ["standard_area_id"], :name => "index_prop_changes_on_standard_area_id"
  add_index "prop_changes", ["standard_id"], :name => "index_prop_changes_on_standard_id"
  add_index "prop_changes", ["state_id"], :name => "index_prop_changes_on_state_id"

  create_table "standard_areas", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "standard_id"
  end

  add_index "standard_areas", ["standard_id"], :name => "index_standard_areas_on_standard_id"

  create_table "standards", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "name"
    t.string   "email_address"
    t.boolean  "administrator",                           :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",                                   :default => "active"
    t.datetime "key_timestamp"
  end

  add_index "users", ["state"], :name => "index_users_on_state"

end
