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

ActiveRecord::Schema.define(:version => 20111222092909) do

  create_table "addresses", :force => true do |t|
    t.string   "road"
    t.string   "village"
    t.string   "postcode"
    t.string   "phone"
    t.integer  "location"
    t.string   "latitude"
    t.string   "longitude"
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clinics", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", :force => true do |t|
    t.boolean  "reaction"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.string   "village"
    t.string   "district"
    t.string   "union"
    t.string   "upozilla"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", :force => true do |t|
    t.string   "registration"
    t.string   "name"
    t.integer  "year_of_birth"
    t.boolean  "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "personal_histories", :force => true do |t|
    t.string   "occupation"
    t.string   "education"
    t.integer  "guardian"
    t.integer  "address"
    t.integer  "members"
    t.integer  "income"
    t.integer  "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reactions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "remarks", :force => true do |t|
    t.integer  "reporter"
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "staffs", :force => true do |t|
    t.string   "name"
    t.integer  "clinic"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
