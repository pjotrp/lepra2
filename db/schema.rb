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
    t.integer  "personal_history_id"
    t.string   "road",                :null => false
    t.string   "village",             :null => false
    t.string   "postcode"
    t.string   "phone"
    t.integer  "location",            :null => false
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
    t.integer  "person_id"
    t.integer  "staff_id"
    t.date     "date"
    t.string   "patient_type"
    t.string   "out"
    t.integer  "status"
    t.string   "treatment"
    t.integer  "doses"
    t.date     "mdt_date"
    t.integer  "smearf"
    t.date     "smearf_date"
    t.integer  "smear"
    t.date     "smear_date"
    t.date     "rft_date"
    t.date     "contact_planned"
    t.string   "detection"
    t.string   "referred"
    t.string   "disability"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.integer  "address_id"
    t.integer  "clinic_id"
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
    t.string   "registration",  :null => false
    t.string   "name",          :null => false
    t.integer  "year_of_birth", :null => false
    t.boolean  "male"
    t.string   "fathers_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "personal_histories", :force => true do |t|
    t.integer  "person_id"
    t.date     "registration_date"
    t.integer  "staff"
    t.string   "occupation"
    t.string   "education"
    t.string   "guardian"
    t.integer  "address"
    t.integer  "members"
    t.integer  "income"
    t.integer  "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reactions", :force => true do |t|
    t.integer  "person_id"
    t.date     "date"
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
    t.integer  "clinic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
