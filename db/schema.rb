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

ActiveRecord::Schema.define(:version => 20100401115006) do

  create_table "metric_records", :force => true do |t|
    t.integer  "metric_id"
    t.float    "value",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "metrics", :force => true do |t|
    t.string   "title",                              :null => false
    t.string   "description"
    t.integer  "pad_id"
    t.string   "data_type",   :default => "Integer"
    t.string   "prefix"
    t.string   "postfix"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pads", :force => true do |t|
    t.text     "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.string   "state",                                   :default => "passive"
    t.datetime "deleted_at"
  end

end
