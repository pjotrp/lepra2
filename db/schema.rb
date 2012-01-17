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

ActiveRecord::Schema.define(:version => 20111228092547) do

  create_table "addresses", :force => true do |t|
    t.integer  "location_id"
    t.integer  "person_id"
    t.string   "road",        :null => false
    t.string   "village",     :null => false
    t.string   "postcode"
    t.string   "phone"
    t.integer  "clinic_id"
    t.string   "latitude"
    t.string   "longitude"
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addresses", ["person_id"], :name => "index_addresses_on_person_id"

  create_table "assessments", :force => true do |t|
    t.integer  "person_id"
    t.integer  "contact_id"
    t.string   "registration"
    t.date     "date"
    t.boolean  "relapse"
    t.integer  "lesions"
    t.boolean  "lesions_inflam"
    t.boolean  "lesions_face"
    t.boolean  "lesions_arm_r"
    t.boolean  "lesions_arm_l"
    t.boolean  "lesions_trunk"
    t.boolean  "lesions_leg_r"
    t.boolean  "lesions_leg_l"
    t.boolean  "oed_hands"
    t.boolean  "oed_feet"
    t.integer  "ulcers"
    t.boolean  "ulcers_palm_simple_r"
    t.boolean  "ulcers_palm_simple_l"
    t.boolean  "ulcers_sole_simple_r"
    t.boolean  "ulcers_sole_simple_l"
    t.boolean  "ulcers_palm_complicated_r"
    t.boolean  "ulcers_palm_complicated_l"
    t.boolean  "ulcers_sole_complicated_r"
    t.boolean  "ulcers_sole_complicated_l"
    t.boolean  "ulcers_palm_malignant_r"
    t.boolean  "ulcers_palm_malignant_l"
    t.boolean  "ulcers_sole_malignant_r"
    t.boolean  "ulcers_sole_malignant_l"
    t.boolean  "ulcers_palm_infected_r"
    t.boolean  "ulcers_palm_infected_l"
    t.boolean  "ulcers_sole_infected_r"
    t.boolean  "ulcers_sole_infected_l"
    t.integer  "sensory_score_hand_r"
    t.integer  "sensory_score_hand_l"
    t.integer  "sensory_score_foot_r"
    t.integer  "sensory_score_foot_l"
    t.integer  "sensory_score_eye_r"
    t.integer  "sensory_score_eye_l"
    t.boolean  "deformity_hag_r"
    t.boolean  "deformity_hag_l"
    t.boolean  "deformity_facial_r"
    t.boolean  "deformity_facial_l"
    t.boolean  "deformity_claw_hand_r"
    t.boolean  "deformity_claw_hand_l"
    t.boolean  "deformity_ape_thumb_r"
    t.boolean  "deformity_ape_thumb_l"
    t.boolean  "deformity_wrist_drop_r"
    t.boolean  "deformity_wrist_drop_l"
    t.boolean  "deformity_foot_drop_r"
    t.boolean  "deformity_foot_drop_l"
    t.boolean  "deformity_claw_toes_r"
    t.boolean  "deformity_claw_toes_l"
    t.boolean  "deformity_absent_finger_r"
    t.boolean  "deformity_absent_finger_l"
    t.boolean  "deformity_absent_toes_r"
    t.boolean  "deformity_absent_toes_l"
    t.boolean  "deformity_palmar_r"
    t.boolean  "deformity_palmar_l"
    t.boolean  "deformity_planter_r"
    t.boolean  "deformity_planter_l"
    t.integer  "num_nerve_damage_prev"
    t.boolean  "nerve_facial_enlarged_r"
    t.boolean  "nerve_facial_enlarged_l"
    t.boolean  "nerve_facial_tender_r"
    t.boolean  "nerve_facial_tender_l"
    t.boolean  "nerve_radial_enlarged_r"
    t.boolean  "nerve_radial_enlarged_l"
    t.boolean  "nerve_radial_tender_r"
    t.boolean  "nerve_radial_tender_l"
    t.boolean  "nerve_ulcer_enlarged_r"
    t.boolean  "nerve_ulcer_enlarged_l"
    t.boolean  "nerve_ulcer_tender_r"
    t.boolean  "nerve_ulcer_tender_l"
    t.boolean  "nerve_median_enlarged_r"
    t.boolean  "nerve_median_enlarged_l"
    t.boolean  "nerve_median_tender_r"
    t.boolean  "nerve_median_tender_l"
    t.boolean  "nerve_common_enlarged_r"
    t.boolean  "nerve_common_enlarged_l"
    t.boolean  "nerve_common_tender_r"
    t.boolean  "nerve_common_tender_l"
    t.boolean  "nerve_posterior_enlarged_r"
    t.boolean  "nerve_posterior_enlarged_l"
    t.boolean  "nerve_posterior_tender_r"
    t.boolean  "nerve_posterior_tender_l"
    t.integer  "qmt_eye_closure_strength_r"
    t.integer  "qmt_eye_closure_strength_l"
    t.integer  "qmt_eye_closure_gap_r"
    t.integer  "qmt_eye_closure_gap_l"
    t.integer  "qmt_little_finger_r"
    t.integer  "qmt_little_finger_l"
    t.integer  "qmt_thumb_r"
    t.integer  "qmt_thumb_l"
    t.integer  "qmt_wrist_r"
    t.integer  "qmt_wrist_l"
    t.integer  "qmt_dorsiflexion_foot_r"
    t.integer  "qmt_dorsiflexion_foot_l"
    t.boolean  "sensitivity_hand_r01"
    t.boolean  "sensitivity_hand_r02"
    t.boolean  "sensitivity_hand_r03"
    t.boolean  "sensitivity_hand_r04"
    t.boolean  "sensitivity_hand_r05"
    t.boolean  "sensitivity_hand_r06"
    t.boolean  "sensitivity_hand_r07"
    t.boolean  "sensitivity_hand_r08"
    t.boolean  "sensitivity_hand_r09"
    t.boolean  "sensitivity_hand_r10"
    t.boolean  "sensitivity_hand_r11"
    t.boolean  "sensitivity_hand_r12"
    t.boolean  "sensitivity_hand_l01"
    t.boolean  "sensitivity_hand_l02"
    t.boolean  "sensitivity_hand_l03"
    t.boolean  "sensitivity_hand_l04"
    t.boolean  "sensitivity_hand_l05"
    t.boolean  "sensitivity_hand_l06"
    t.boolean  "sensitivity_hand_l07"
    t.boolean  "sensitivity_hand_l08"
    t.boolean  "sensitivity_hand_l09"
    t.boolean  "sensitivity_hand_l10"
    t.boolean  "sensitivity_hand_l11"
    t.boolean  "sensitivity_hand_l12"
    t.boolean  "sensitivity_foot_r01"
    t.boolean  "sensitivity_foot_r02"
    t.boolean  "sensitivity_foot_r03"
    t.boolean  "sensitivity_foot_r04"
    t.boolean  "sensitivity_foot_r05"
    t.boolean  "sensitivity_foot_r06"
    t.boolean  "sensitivity_foot_r07"
    t.boolean  "sensitivity_foot_r08"
    t.boolean  "sensitivity_foot_r09"
    t.boolean  "sensitivity_foot_r10"
    t.boolean  "sensitivity_foot_r11"
    t.boolean  "sensitivity_foot_l01"
    t.boolean  "sensitivity_foot_l02"
    t.boolean  "sensitivity_foot_l03"
    t.boolean  "sensitivity_foot_l04"
    t.boolean  "sensitivity_foot_l05"
    t.boolean  "sensitivity_foot_l06"
    t.boolean  "sensitivity_foot_l07"
    t.boolean  "sensitivity_foot_l08"
    t.boolean  "sensitivity_foot_l09"
    t.boolean  "sensitivity_foot_l10"
    t.boolean  "sensitivity_foot_l11"
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assessments", ["person_id"], :name => "index_assessments_on_person_id"

  create_table "clinics", :force => true do |t|
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clinics", ["id"], :name => "index_clinics_on_id"

  create_table "contacts", :force => true do |t|
    t.integer  "person_id"
    t.string   "registration"
    t.date     "date"
    t.integer  "clinic_id"
    t.integer  "staff_id"
    t.string   "symbol_patient_type"
    t.string   "symbol_patient_status"
    t.boolean  "final_assessment"
    t.string   "symbol_medication"
    t.string   "symbol_treatment"
    t.integer  "mdt_dose"
    t.date     "mdt_date"
    t.integer  "symbol_smearf"
    t.date     "smearf_date"
    t.integer  "symbol_smear"
    t.date     "smear_date"
    t.date     "rft_date"
    t.boolean  "prednisolon"
    t.boolean  "diy"
    t.string   "diy_specify"
    t.boolean  "hospital_admission"
    t.string   "hospital_name"
    t.boolean  "hospital_neuritis"
    t.boolean  "hospital_plantar_alcer"
    t.boolean  "hospital_eye_complication"
    t.boolean  "hospital_other"
    t.string   "hospital_specify"
    t.date     "contact_planned"
    t.string   "symbol_detection"
    t.string   "symbol_referred"
    t.integer  "health_worker"
    t.integer  "symbol_who_disability"
    t.string   "symbol_chronic_disability"
    t.integer  "duration_years"
    t.integer  "duration_months"
    t.integer  "young_years"
    t.integer  "young_months"
    t.boolean  "bcg_scar"
    t.boolean  "trauma_operation"
    t.boolean  "disease"
    t.string   "symbol_disease_descr"
    t.integer  "lesions"
    t.boolean  "pregnant"
    t.date     "pregnancy_date"
    t.boolean  "breast_feeding"
    t.boolean  "surgical_rehab"
    t.boolean  "social_rehab"
    t.integer  "symbol_final_who_disability"
    t.integer  "final_disability"
    t.date     "final_date"
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contacts", ["person_id"], :name => "index_contacts_on_person_id"

  create_table "locations", :force => true do |t|
    t.integer  "clinic_id"
    t.string   "village"
    t.string   "district"
    t.string   "union"
    t.string   "upozilla"
    t.string   "latitude"
    t.string   "longitude"
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", :force => true do |t|
    t.string   "registration",                     :null => false
    t.string   "name",                             :null => false
    t.string   "nickname"
    t.string   "national_id"
    t.integer  "year_of_birth",                    :null => false
    t.boolean  "male",          :default => false, :null => false
    t.string   "fathers_name"
    t.string   "reg_study"
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "people", ["name"], :name => "index_people_on_name"
  add_index "people", ["registration"], :name => "index_people_on_registration"

  create_table "personal_histories", :force => true do |t|
    t.integer  "person_id"
    t.string   "registration",      :null => false
    t.date     "registration_date", :null => false
    t.date     "date",              :null => false
    t.integer  "staff_id",          :null => false
    t.integer  "finder_lca"
    t.string   "symbol_occupation"
    t.string   "symbol_education"
    t.string   "symbol_guardian"
    t.integer  "members"
    t.integer  "income"
    t.boolean  "latrine_access"
    t.boolean  "rft"
    t.boolean  "died"
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "personal_histories", ["person_id"], :name => "index_personal_histories_on_person_id"

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "reactions", :force => true do |t|
    t.integer  "person_id"
    t.integer  "contact_id"
    t.string   "registration"
    t.date     "date"
    t.date     "prednisolon_date"
    t.integer  "bands_study"
    t.integer  "mdt_dose"
    t.boolean  "treatment"
    t.integer  "duration_months"
    t.boolean  "type1"
    t.boolean  "type_neuritis"
    t.boolean  "type2"
    t.integer  "type1_grade"
    t.integer  "type2_grade"
    t.integer  "nerve_pain_score_facila_r"
    t.integer  "nerve_pain_score_facila_l"
    t.integer  "nerve_pain_score_radial_r"
    t.integer  "nerve_pain_score_radial_l"
    t.integer  "nerve_pain_score_ulnar_r"
    t.integer  "nerve_pain_score_ulnar_l"
    t.integer  "nerve_pain_score_median_r"
    t.integer  "nerve_pain_score_median_l"
    t.integer  "nerve_pain_score_common_r"
    t.integer  "nerve_pain_score_common_l"
    t.integer  "nerve_pain_score_posterior_r"
    t.integer  "nerve_pain_score_posterior_l"
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reactions", ["person_id"], :name => "index_reactions_on_person_id"

  create_table "remarks", :force => true do |t|
    t.integer  "reporter"
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "staffs", :force => true do |t|
    t.string   "name"
    t.string   "registration"
    t.integer  "clinic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "staffs", ["name"], :name => "index_staffs_on_name"

  create_table "symbol_lookups", :force => true do |t|
    t.string   "name"
    t.string   "value"
    t.string   "description"
    t.integer  "rank"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "symbol_lookups", ["name"], :name => "index_symbol_lookups_on_name"

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
