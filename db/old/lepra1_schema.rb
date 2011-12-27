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

ActiveRecord::Schema.define(:version => 0) do

  create_table "Patient1", :id => false, :force => true do |t|
    t.integer  "id",                         :default => 0, :null => false
    t.datetime "LastUpdate",                                :null => false
    t.integer  "CLINIC_NUM"
    t.integer  "REG_MAIN"
    t.integer  "PID"
    t.integer  "Research",     :limit => 1
    t.string   "Name",         :limit => 25
    t.integer  "Age"
    t.integer  "YOB",          :limit => 2
    t.datetime "DOB"
    t.integer  "DURATION_Y",   :limit => 2
    t.integer  "DURATION_M",   :limit => 2
    t.integer  "Gender",       :limit => 2
    t.integer  "Occupation",   :limit => 2
    t.datetime "REG_DATE"
    t.datetime "entrydate"
    t.integer  "Guardian",     :limit => 2
    t.string   "GdnName",      :limit => 25
    t.integer  "loc_Dist"
    t.integer  "loc_Upo"
    t.integer  "loc_Uni"
    t.string   "loc_Village",  :limit => 15
    t.string   "Phonenr",      :limit => 15
    t.integer  "perm_Dist"
    t.integer  "perm_Upo"
    t.integer  "perm_Uni"
    t.string   "perm_Village", :limit => 15
    t.float    "perm_Latt"
    t.float    "perm_Long"
    t.integer  "Csdone",       :limit => 1
    t.datetime "CONTACTLST"
    t.datetime "CONTACTPLN"
    t.integer  "REACTION",     :limit => 1
    t.integer  "TYPE",         :limit => 2
    t.integer  "GROUP",        :limit => 2
    t.integer  "DETECT",       :limit => 2
    t.integer  "Referred",     :limit => 2
    t.integer  "HW_NUM",       :limit => 2
    t.integer  "FINDER_LCA",   :limit => 2
    t.integer  "DISAB",        :limit => 2
    t.integer  "Score",        :limit => 2
    t.integer  "STATUS",       :limit => 2
    t.datetime "MDTDATE"
    t.integer  "DOSES",        :limit => 2
    t.integer  "SMEARF",       :limit => 2
    t.datetime "SMEARFDATE"
    t.integer  "SMEARL",       :limit => 2
    t.datetime "SMEARLDATE"
    t.datetime "RFT_DATE"
    t.integer  "FINAL_ASS",    :limit => 1
    t.datetime "FINAL_DATE"
    t.integer  "FDISAB",       :limit => 2
    t.integer  "FDEF_WHO_G",   :limit => 2
    t.integer  "OUT",          :limit => 2
    t.integer  "Checked",      :limit => 1
    t.string   "Remarks",      :limit => 50,                :null => false
  end

  create_table "new__tclinic", :force => true do |t|
    t.integer "Clinic_num"
    t.integer "loc_District"
    t.integer "loc_Upz"
    t.integer "loc_Un"
    t.integer "loc_Vllg"
    t.integer "Registrations20020402"
    t.binary  "Show",                  :limit => 1
  end

  add_index "new__tclinic", ["Clinic_num"], :name => "ix_clinicnum", :unique => true

  create_table "new__tdisabilities", :force => true do |t|
    t.integer  "REG_STUDY",  :limit => 8
    t.integer  "Reg_ID",     :limit => 8, :null => false
    t.datetime "DATE"
    t.float    "LCA"
    t.integer  "MDT_DOSE",   :limit => 2
    t.integer  "ULCS_NUM",   :limit => 2
    t.binary   "ULCS_PAL_R", :limit => 1
    t.binary   "ULCS_PAL_L", :limit => 1
    t.binary   "ULCS_SOL_R", :limit => 1
    t.binary   "ULCS_SOL_L", :limit => 1
    t.binary   "ULCC_PAL_R", :limit => 1
    t.binary   "ULCC_PAL_L", :limit => 1
    t.binary   "ULCC_SOL_R", :limit => 1
    t.binary   "ULCC_SOL_L", :limit => 1
    t.binary   "ULCM_PAL_R", :limit => 1
    t.binary   "ULCM_PAL_L", :limit => 1
    t.binary   "ULCM_SOL_R", :limit => 1
    t.binary   "ULCM_SOL_L", :limit => 1
    t.binary   "ULCI_PAL_R", :limit => 1
    t.binary   "ULCI_PAL_L", :limit => 1
    t.binary   "ULCI_SOL_R", :limit => 1
    t.binary   "ULCI_SOL_L", :limit => 1
    t.integer  "ST_HAND_R",  :limit => 2
    t.integer  "ST_HAND_L",  :limit => 1
    t.integer  "ST_FOOT_R",  :limit => 2
    t.integer  "ST_FOOT_L",  :limit => 2
    t.integer  "ST_EYE_R",   :limit => 2
    t.integer  "ST_EYE_L",   :limit => 2
    t.binary   "SHR01",      :limit => 1
    t.binary   "SHR02",      :limit => 1
    t.binary   "SHR03",      :limit => 1
    t.binary   "SHR04",      :limit => 1
    t.binary   "SHR05",      :limit => 1
    t.binary   "SHR06",      :limit => 1
    t.binary   "SHR07",      :limit => 1
    t.binary   "SHR08",      :limit => 1
    t.binary   "SHR09",      :limit => 1
    t.binary   "SHR10",      :limit => 1
    t.binary   "SHR11",      :limit => 1
    t.binary   "SHR12",      :limit => 1
    t.binary   "SHL01",      :limit => 1
    t.binary   "SHL02",      :limit => 1
    t.binary   "SHL03",      :limit => 1
    t.binary   "SHL04",      :limit => 1
    t.binary   "SHL05",      :limit => 1
    t.binary   "SHL06",      :limit => 1
    t.binary   "SHL07",      :limit => 1
    t.binary   "SHL08",      :limit => 1
    t.binary   "SHL09",      :limit => 1
    t.binary   "SHL10",      :limit => 1
    t.binary   "SHL11",      :limit => 1
    t.binary   "SHL12",      :limit => 1
    t.binary   "SFR01",      :limit => 1
    t.binary   "SFR02",      :limit => 1
    t.binary   "SFR03",      :limit => 1
    t.binary   "SFR04",      :limit => 1
    t.binary   "SFR05",      :limit => 1
    t.binary   "SFR06",      :limit => 1
    t.binary   "SFR07",      :limit => 1
    t.binary   "SFR08",      :limit => 1
    t.binary   "SFR09",      :limit => 1
    t.binary   "SFR10",      :limit => 1
    t.binary   "SFR11",      :limit => 1
    t.binary   "SFL01",      :limit => 1
    t.binary   "SFL02",      :limit => 1
    t.binary   "SFL03",      :limit => 1
    t.binary   "SFL04",      :limit => 1
    t.binary   "SFL05",      :limit => 1
    t.binary   "SFL06",      :limit => 1
    t.binary   "SFL07",      :limit => 1
    t.binary   "SFL08",      :limit => 1
    t.binary   "SFL09",      :limit => 1
    t.binary   "SFL10",      :limit => 1
    t.binary   "SFL11",      :limit => 1
    t.integer  "QMT_EY_SR",  :limit => 2
    t.integer  "QMT_EY_SL",  :limit => 2
    t.integer  "QMT_EY_GR",  :limit => 2
    t.integer  "QMT_EY_GL",  :limit => 2
    t.integer  "QMT_LF_AR",  :limit => 2
    t.integer  "QMT_LF_AL",  :limit => 2
    t.integer  "QMT_TH_AR",  :limit => 2
    t.integer  "QMT_TH_AL",  :limit => 2
    t.integer  "QMT_WR_ER",  :limit => 2
    t.integer  "QMT_WR_EL",  :limit => 2
    t.integer  "QMT_DO_R",   :limit => 2
    t.integer  "QMT_DO_L",   :limit => 2
    t.binary   "TRAUMA",     :limit => 1
    t.binary   "DISEASE",    :limit => 1
    t.string   "DISEASE_S"
    t.datetime "PRE_DOSE"
    t.binary   "PREGNANT",   :limit => 1
    t.datetime "PREGN_DATE"
    t.binary   "BREASTFEED", :limit => 1
    t.binary   "HOSP",       :limit => 1
    t.binary   "NEURITUS",   :limit => 1
    t.binary   "PLANTAR_UL", :limit => 1
    t.binary   "EYE_COMPL",  :limit => 1
    t.binary   "H_OTHER",    :limit => 1
    t.string   "H_OTHERSTR"
    t.integer  "DIY",        :limit => 2
    t.string   "SURGERY1"
    t.string   "SURGERY2"
  end

  add_index "new__tdisabilities", ["Reg_ID", "DATE"], :name => "Ix_tDisabilities"

  create_table "new__temployees", :force => true do |t|
    t.integer "Empl_ID"
    t.string  "Init",    :limit => 5
    t.string  "Name",    :limit => 25
    t.string  "Title",   :limit => 20
    t.string  "Station", :limit => 25
    t.integer "Status",  :limit => 2,  :null => false
  end

  add_index "new__temployees", ["Empl_ID"], :name => "ix_Empl_ID", :unique => true

  create_table "new__tloc__district", :force => true do |t|
    t.integer "Dist"
    t.string  "District", :limit => 50
    t.binary  "Show",     :limit => 1
  end

  add_index "new__tloc__district", ["Dist"], :name => "ix_loc_district", :unique => true
  add_index "new__tloc__district", ["District"], :name => "ix_district"

  create_table "new__tloc__union", :force => true do |t|
    t.integer "Upz_code"
    t.string  "Uni",        :limit => 50
    t.integer "Union_code"
    t.binary  "Show",       :limit => 1
  end

  add_index "new__tloc__union", ["Uni"], :name => "ix_uni"
  add_index "new__tloc__union", ["Union_code"], :name => "ix_tloc_union", :unique => true
  add_index "new__tloc__union", ["Upz_code"], :name => "ix_upz_Code"

  create_table "new__tloc__upozilla", :force => true do |t|
    t.integer "Dist"
    t.string  "Upozilla", :limit => 50
    t.integer "Upz_code"
    t.binary  "Show",     :limit => 1
  end

  add_index "new__tloc__upozilla", ["Dist"], :name => "ix_dist"
  add_index "new__tloc__upozilla", ["Upozilla"], :name => "ix_upozilla"
  add_index "new__tloc__upozilla", ["Upz_code"], :name => "ix_tloc_upozilla", :unique => true

  create_table "new__tloc__village", :force => true do |t|
    t.integer "Union_code"
    t.string  "Village",             :limit => 25
    t.integer "Vlg_code"
    t.binary  "Show",                :limit => 1
    t.integer "Registrations020402", :limit => 2
  end

  add_index "new__tloc__village", ["Union_code"], :name => "ix_union_code"
  add_index "new__tloc__village", ["Village"], :name => "ix_village"
  add_index "new__tloc__village", ["Vlg_code"], :name => "ix_tloc_village", :unique => true

  create_table "new__tlookup", :force => true do |t|
    t.integer "CodeID"
    t.string  "Variable", :limit => 50
    t.string  "Value",    :limit => 50
    t.string  "Label",    :limit => 50
    t.integer "ValueNum"
  end

  add_index "new__tlookup", ["Label"], :name => "ix_label"
  add_index "new__tlookup", ["ValueNum"], :name => "ix_valuenum"
  add_index "new__tlookup", ["Variable", "Value"], :name => "ix_tlookup", :unique => true

  create_table "new__tlookup2", :force => true do |t|
    t.integer "l2id"
    t.string  "table",       :limit => 25
    t.string  "variable",    :limit => 10
    t.string  "description"
  end

  add_index "new__tlookup2", ["table", "variable"], :name => "ix_tlookup2", :unique => true

  create_table "new__tpatient1", :force => true do |t|
    t.datetime "LastUpdate",                 :null => false
    t.integer  "CLINIC_NUM"
    t.integer  "REG_MAIN"
    t.integer  "PID"
    t.integer  "Research",     :limit => 1
    t.string   "Name",         :limit => 25
    t.integer  "Age"
    t.integer  "YOB",          :limit => 2
    t.datetime "DOB"
    t.integer  "DURATION_Y",   :limit => 2
    t.integer  "DURATION_M",   :limit => 2
    t.integer  "Gender",       :limit => 2
    t.integer  "Occupation",   :limit => 2
    t.datetime "REG_DATE"
    t.datetime "entrydate"
    t.integer  "Guardian",     :limit => 2
    t.string   "GdnName",      :limit => 25
    t.integer  "loc_Dist"
    t.integer  "loc_Upo"
    t.integer  "loc_Uni"
    t.string   "loc_Village",  :limit => 15
    t.string   "Phonenr",      :limit => 15
    t.integer  "perm_Dist"
    t.integer  "perm_Upo"
    t.integer  "perm_Uni"
    t.string   "perm_Village", :limit => 15
    t.float    "perm_Latt"
    t.float    "perm_Long"
    t.integer  "Csdone",       :limit => 1
    t.datetime "CONTACTLST"
    t.datetime "CONTACTPLN"
    t.integer  "REACTION",     :limit => 1
    t.integer  "TYPE",         :limit => 2
    t.integer  "GROUP",        :limit => 2
    t.integer  "DETECT",       :limit => 2
    t.integer  "Referred",     :limit => 2
    t.integer  "HW_NUM",       :limit => 2
    t.integer  "FINDER_LCA",   :limit => 2
    t.integer  "DISAB",        :limit => 2
    t.integer  "Score",        :limit => 2
    t.integer  "STATUS",       :limit => 2
    t.datetime "MDTDATE"
    t.integer  "DOSES",        :limit => 2
    t.integer  "SMEARF",       :limit => 2
    t.datetime "SMEARFDATE"
    t.integer  "SMEARL",       :limit => 2
    t.datetime "SMEARLDATE"
    t.datetime "RFT_DATE"
    t.integer  "FINAL_ASS",    :limit => 1
    t.datetime "FINAL_DATE"
    t.integer  "FDISAB",       :limit => 2
    t.integer  "FDEF_WHO_G",   :limit => 2
    t.integer  "OUT",          :limit => 2
    t.integer  "Checked",      :limit => 1
    t.string   "Remarks",      :limit => 50, :null => false
  end

  add_index "new__tpatient1", ["Age"], :name => "ix_age"
  add_index "new__tpatient1", ["CLINIC_NUM"], :name => "ix_clinic_num"
  add_index "new__tpatient1", ["GdnName"], :name => "ix_gdnname"
  add_index "new__tpatient1", ["Name"], :name => "ix_name"
  add_index "new__tpatient1", ["REG_DATE"], :name => "ix_reg_date"
  add_index "new__tpatient1", ["REG_MAIN"], :name => "ix_tpatient1", :unique => true
  add_index "new__tpatient1", ["Remarks"], :name => "ix_remarks", :length => {"Remarks"=>20}
  add_index "new__tpatient1", ["YOB"], :name => "ix_yob"
  add_index "new__tpatient1", ["loc_Village"], :name => "ix_loc_village"

  create_table "new__tpatientstudy", :force => true do |t|
    t.integer "REG_MAIN"
    t.integer "PID"
    t.integer "SID"
  end

  add_index "new__tpatientstudy", ["REG_MAIN", "SID", "PID"], :name => "ix_tpatientstudy", :unique => true

  create_table "new__treactions", :force => true do |t|
    t.integer  "REG_MAIN"
    t.integer  "REG_STUDY"
    t.datetime "DATE"
    t.binary   "TREATMENT",  :limit => 1
    t.integer  "DOSE",       :limit => 2
    t.integer  "REA_DUR",    :limit => 2
    t.binary   "REA_T1",     :limit => 1
    t.binary   "REA_TN",     :limit => 1
    t.binary   "REA_T2",     :limit => 1
    t.integer  "T1R_N",      :limit => 2
    t.integer  "T2R",        :limit => 2
    t.datetime "PED_DATE"
    t.integer  "NLESIONS",   :limit => 2
    t.integer  "RNER_FAC_R", :limit => 2
    t.integer  "RNER_FAC_L", :limit => 2
    t.integer  "RNER_RAD_R", :limit => 2
    t.integer  "RNER_RAD_L", :limit => 2
    t.integer  "RNER_ULN_R", :limit => 2
    t.integer  "RNER_ULN_L", :limit => 2
    t.integer  "RNER_MED_R", :limit => 2
    t.integer  "RNER_MED_L", :limit => 2
    t.integer  "RNER_COM_R", :limit => 2
    t.integer  "RNER_COM_L", :limit => 2
    t.integer  "RNER_POS_R", :limit => 2
    t.integer  "RNER_POS_L", :limit => 2
    t.integer  "STAT",       :limit => 2
  end

  add_index "new__treactions", ["REG_MAIN", "DATE"], :name => "ix_treactions", :unique => true

  create_table "new__tstudies", :force => true do |t|
    t.integer  "SID"
    t.string   "RegMain_grp",    :limit => 50
    t.integer  "MinOfREG_MAIN"
    t.integer  "MaxOfREG_MAIN"
    t.integer  "N_inUse"
    t.datetime "MinOfREG_DATE"
    t.datetime "MaxOfREG_DATE"
    t.integer  "MinOfREG_STUDY"
    t.integer  "MaxOfREG_STUDY"
    t.string   "StudyName",      :limit => 25
    t.string   "StudyDescr"
    t.string   "Studynr_start",  :limit => 25
    t.string   "Studynr_end",    :limit => 25
  end

  add_index "new__tstudies", ["SID"], :name => "ix_tstudies", :unique => true
  add_index "new__tstudies", ["StudyName"], :name => "ix_studyname"

  create_table "tclinic", :force => true do |t|
    t.datetime "LastUpdate",                         :null => false
    t.integer  "Clinic_num"
    t.integer  "loc_District"
    t.integer  "loc_Upz"
    t.integer  "loc_Un"
    t.integer  "loc_Vllg"
    t.integer  "Registrations20020402"
    t.binary   "Show",                  :limit => 1
  end

  add_index "tclinic", ["Clinic_num"], :name => "ix_clinicnum", :unique => true

  create_table "tdisabilities", :force => true do |t|
    t.datetime "LastUpdate",              :null => false
    t.integer  "REG_STUDY",  :limit => 8
    t.integer  "Reg_ID",     :limit => 8, :null => false
    t.datetime "DATE"
    t.float    "LCA"
    t.integer  "MDT_DOSE",   :limit => 2
    t.integer  "ULCS_NUM",   :limit => 2
    t.binary   "ULCS_PAL_R", :limit => 1
    t.binary   "ULCS_PAL_L", :limit => 1
    t.binary   "ULCS_SOL_R", :limit => 1
    t.binary   "ULCS_SOL_L", :limit => 1
    t.binary   "ULCC_PAL_R", :limit => 1
    t.binary   "ULCC_PAL_L", :limit => 1
    t.binary   "ULCC_SOL_R", :limit => 1
    t.binary   "ULCC_SOL_L", :limit => 1
    t.binary   "ULCM_PAL_R", :limit => 1
    t.binary   "ULCM_PAL_L", :limit => 1
    t.binary   "ULCM_SOL_R", :limit => 1
    t.binary   "ULCM_SOL_L", :limit => 1
    t.binary   "ULCI_PAL_R", :limit => 1
    t.binary   "ULCI_PAL_L", :limit => 1
    t.binary   "ULCI_SOL_R", :limit => 1
    t.binary   "ULCI_SOL_L", :limit => 1
    t.integer  "ST_HAND_R",  :limit => 2
    t.integer  "ST_HAND_L",  :limit => 1
    t.integer  "ST_FOOT_R",  :limit => 2
    t.integer  "ST_FOOT_L",  :limit => 2
    t.integer  "ST_EYE_R",   :limit => 2
    t.integer  "ST_EYE_L",   :limit => 2
    t.binary   "SHR01",      :limit => 1
    t.binary   "SHR02",      :limit => 1
    t.binary   "SHR03",      :limit => 1
    t.binary   "SHR04",      :limit => 1
    t.binary   "SHR05",      :limit => 1
    t.binary   "SHR06",      :limit => 1
    t.binary   "SHR07",      :limit => 1
    t.binary   "SHR08",      :limit => 1
    t.binary   "SHR09",      :limit => 1
    t.binary   "SHR10",      :limit => 1
    t.binary   "SHR11",      :limit => 1
    t.binary   "SHR12",      :limit => 1
    t.binary   "SHL01",      :limit => 1
    t.binary   "SHL02",      :limit => 1
    t.binary   "SHL03",      :limit => 1
    t.binary   "SHL04",      :limit => 1
    t.binary   "SHL05",      :limit => 1
    t.binary   "SHL06",      :limit => 1
    t.binary   "SHL07",      :limit => 1
    t.binary   "SHL08",      :limit => 1
    t.binary   "SHL09",      :limit => 1
    t.binary   "SHL10",      :limit => 1
    t.binary   "SHL11",      :limit => 1
    t.binary   "SHL12",      :limit => 1
    t.binary   "SFR01",      :limit => 1
    t.binary   "SFR02",      :limit => 1
    t.binary   "SFR03",      :limit => 1
    t.binary   "SFR04",      :limit => 1
    t.binary   "SFR05",      :limit => 1
    t.binary   "SFR06",      :limit => 1
    t.binary   "SFR07",      :limit => 1
    t.binary   "SFR08",      :limit => 1
    t.binary   "SFR09",      :limit => 1
    t.binary   "SFR10",      :limit => 1
    t.binary   "SFR11",      :limit => 1
    t.binary   "SFL01",      :limit => 1
    t.binary   "SFL02",      :limit => 1
    t.binary   "SFL03",      :limit => 1
    t.binary   "SFL04",      :limit => 1
    t.binary   "SFL05",      :limit => 1
    t.binary   "SFL06",      :limit => 1
    t.binary   "SFL07",      :limit => 1
    t.binary   "SFL08",      :limit => 1
    t.binary   "SFL09",      :limit => 1
    t.binary   "SFL10",      :limit => 1
    t.binary   "SFL11",      :limit => 1
    t.integer  "QMT_EY_SR",  :limit => 2
    t.integer  "QMT_EY_SL",  :limit => 2
    t.integer  "QMT_EY_GR",  :limit => 2
    t.integer  "QMT_EY_GL",  :limit => 2
    t.integer  "QMT_LF_AR",  :limit => 2
    t.integer  "QMT_LF_AL",  :limit => 2
    t.integer  "QMT_TH_AR",  :limit => 2
    t.integer  "QMT_TH_AL",  :limit => 2
    t.integer  "QMT_WR_ER",  :limit => 2
    t.integer  "QMT_WR_EL",  :limit => 2
    t.integer  "QMT_DO_R",   :limit => 2
    t.integer  "QMT_DO_L",   :limit => 2
    t.binary   "TRAUMA",     :limit => 1
    t.binary   "DISEASE",    :limit => 1
    t.string   "DISEASE_S"
    t.datetime "PRE_DOSE"
    t.binary   "PREGNANT",   :limit => 1
    t.datetime "PREGN_DATE"
    t.binary   "BREASTFEED", :limit => 1
    t.binary   "HOSP",       :limit => 1
    t.binary   "NEURITUS",   :limit => 1
    t.binary   "PLANTAR_UL", :limit => 1
    t.binary   "EYE_COMPL",  :limit => 1
    t.binary   "H_OTHER",    :limit => 1
    t.string   "H_OTHERSTR"
    t.integer  "DIY",        :limit => 2
    t.string   "SURGERY1"
    t.string   "SURGERY2"
  end

  add_index "tdisabilities", ["Reg_ID", "DATE"], :name => "Ix_tDisabilities"

  create_table "temployees", :force => true do |t|
    t.datetime "LastUpdate",               :null => false
    t.integer  "Empl_ID"
    t.string   "Init",       :limit => 5
    t.string   "Name",       :limit => 25
    t.string   "Title",      :limit => 20
    t.string   "Station",    :limit => 25
    t.integer  "StatusEmpl", :limit => 2,  :null => false
  end

  add_index "temployees", ["Empl_ID"], :name => "ix_Empl_ID", :unique => true
  add_index "temployees", ["Name"], :name => "ix_name"
  add_index "temployees", ["StatusEmpl"], :name => "ix_statusempl"

  create_table "tloc__district", :force => true do |t|
    t.datetime "LastUpdate",               :null => false
    t.integer  "Dist"
    t.string   "District",   :limit => 50
    t.binary   "Show",       :limit => 1
  end

  add_index "tloc__district", ["Dist"], :name => "ix_loc_district", :unique => true
  add_index "tloc__district", ["District"], :name => "ix_district"

  create_table "tloc__union", :force => true do |t|
    t.datetime "LastUpdate",               :null => false
    t.integer  "Upz_code"
    t.string   "Uni",        :limit => 50
    t.integer  "Union_code"
    t.binary   "Show",       :limit => 1
  end

  add_index "tloc__union", ["Uni"], :name => "ix_uni"
  add_index "tloc__union", ["Union_code"], :name => "ix_tloc_union", :unique => true
  add_index "tloc__union", ["Upz_code"], :name => "ix_upz_Code"

  create_table "tloc__upozilla", :force => true do |t|
    t.datetime "LastUpdate",               :null => false
    t.integer  "Dist"
    t.string   "Upozilla",   :limit => 50
    t.integer  "Upz_code"
    t.binary   "Show",       :limit => 1
  end

  add_index "tloc__upozilla", ["Dist"], :name => "ix_dist"
  add_index "tloc__upozilla", ["Upozilla"], :name => "ix_upozilla"
  add_index "tloc__upozilla", ["Upz_code"], :name => "ix_tloc_upozilla", :unique => true

  create_table "tloc__village", :force => true do |t|
    t.datetime "LastUpdate",                        :null => false
    t.integer  "Union_code"
    t.string   "Village",             :limit => 25
    t.integer  "Vlg_code"
    t.binary   "Show",                :limit => 1
    t.integer  "Registrations020402", :limit => 2
  end

  add_index "tloc__village", ["Union_code"], :name => "ix_union_code"
  add_index "tloc__village", ["Village"], :name => "ix_village"
  add_index "tloc__village", ["Vlg_code"], :name => "ix_tloc_village", :unique => true

  create_table "tlookup", :force => true do |t|
    t.datetime "LastUpdate",               :null => false
    t.integer  "CodeID"
    t.string   "Variable",   :limit => 50
    t.string   "Value",      :limit => 50
    t.string   "Label",      :limit => 50
    t.integer  "ValueNum"
  end

  add_index "tlookup", ["Label"], :name => "ix_label"
  add_index "tlookup", ["ValueNum"], :name => "ix_valuenum"
  add_index "tlookup", ["Variable", "Value"], :name => "ix_tlookup", :unique => true

  create_table "tlookup2", :force => true do |t|
    t.datetime "LastUpdate",                :null => false
    t.integer  "l2id"
    t.string   "table",       :limit => 25
    t.string   "variable",    :limit => 10
    t.string   "description"
  end

  add_index "tlookup2", ["table", "variable"], :name => "ix_tlookup2", :unique => true

  create_table "tpatient1", :force => true do |t|
    t.datetime "LastUpdate",                 :null => false
    t.integer  "CLINIC_NUM"
    t.integer  "REG_MAIN"
    t.integer  "PID"
    t.integer  "Research",     :limit => 1
    t.string   "Name",         :limit => 25
    t.integer  "Age"
    t.integer  "YOB",          :limit => 2
    t.datetime "DOB"
    t.integer  "DURATION_Y",   :limit => 2
    t.integer  "DURATION_M",   :limit => 2
    t.integer  "Gender",       :limit => 2
    t.integer  "Occupation",   :limit => 2
    t.datetime "REG_DATE"
    t.datetime "entrydate"
    t.integer  "Guardian",     :limit => 2
    t.string   "GdnName",      :limit => 25
    t.integer  "loc_Dist"
    t.integer  "loc_Upo"
    t.integer  "loc_Uni"
    t.string   "loc_Village",  :limit => 15
    t.string   "Phonenr",      :limit => 15
    t.integer  "perm_Dist"
    t.integer  "perm_Upo"
    t.integer  "perm_Uni"
    t.string   "perm_Village", :limit => 15
    t.float    "perm_Latt"
    t.float    "perm_Long"
    t.integer  "Csdone",       :limit => 1
    t.datetime "CONTACTLST"
    t.datetime "CONTACTPLN"
    t.integer  "REACTION",     :limit => 1
    t.integer  "TYPE",         :limit => 2
    t.integer  "GROUP",        :limit => 2
    t.integer  "DETECT",       :limit => 2
    t.integer  "Referred",     :limit => 2
    t.integer  "HW_NUM",       :limit => 2
    t.integer  "FINDER_LCA",   :limit => 2
    t.integer  "DISAB",        :limit => 2
    t.integer  "Score",        :limit => 2
    t.integer  "STATUS",       :limit => 2
    t.datetime "MDTDATE"
    t.integer  "DOSES",        :limit => 2
    t.integer  "SMEARF",       :limit => 2
    t.datetime "SMEARFDATE"
    t.integer  "SMEARL",       :limit => 2
    t.datetime "SMEARLDATE"
    t.datetime "RFT_DATE"
    t.integer  "FINAL_ASS",    :limit => 1
    t.datetime "FINAL_DATE"
    t.integer  "FDISAB",       :limit => 2
    t.integer  "FDEF_WHO_G",   :limit => 2
    t.integer  "OUT",          :limit => 2
    t.integer  "Checked",      :limit => 1
    t.string   "Remarks",      :limit => 50, :null => false
  end

  add_index "tpatient1", ["Age"], :name => "ix_age"
  add_index "tpatient1", ["CLINIC_NUM"], :name => "ix_clinic_num"
  add_index "tpatient1", ["GdnName"], :name => "ix_gdnname"
  add_index "tpatient1", ["Name"], :name => "ix_name"
  add_index "tpatient1", ["REG_DATE"], :name => "ix_reg_date"
  add_index "tpatient1", ["REG_MAIN"], :name => "ix_tpatient1", :unique => true
  add_index "tpatient1", ["Remarks"], :name => "ix_remarks", :length => {"Remarks"=>20}
  add_index "tpatient1", ["YOB"], :name => "ix_yob"
  add_index "tpatient1", ["loc_Village"], :name => "ix_loc_village"

  create_table "tpatient1_start", :force => true do |t|
    t.datetime "LastUpdate",                 :null => false
    t.integer  "CLINIC_NUM"
    t.integer  "REG_MAIN"
    t.integer  "PID"
    t.integer  "Research",     :limit => 1
    t.string   "Name",         :limit => 25
    t.integer  "Age"
    t.integer  "YOB",          :limit => 2
    t.datetime "DOB"
    t.integer  "DURATION_Y",   :limit => 2
    t.integer  "DURATION_M",   :limit => 2
    t.integer  "Gender",       :limit => 2
    t.integer  "Occupation",   :limit => 2
    t.datetime "REG_DATE"
    t.datetime "entrydate"
    t.integer  "Guardian",     :limit => 2
    t.string   "GdnName",      :limit => 25
    t.integer  "loc_Dist"
    t.integer  "loc_Upo"
    t.integer  "loc_Uni"
    t.string   "loc_Village",  :limit => 15
    t.string   "Phonenr",      :limit => 15
    t.integer  "perm_Dist"
    t.integer  "perm_Upo"
    t.integer  "perm_Uni"
    t.string   "perm_Village", :limit => 15
    t.float    "perm_Latt"
    t.float    "perm_Long"
    t.integer  "Csdone",       :limit => 1
    t.datetime "CONTACTLST"
    t.datetime "CONTACTPLN"
    t.integer  "REACTION",     :limit => 1
    t.integer  "TYPE",         :limit => 2
    t.integer  "GROUP",        :limit => 2
    t.integer  "DETECT",       :limit => 2
    t.integer  "Referred",     :limit => 2
    t.integer  "HW_NUM",       :limit => 2
    t.integer  "FINDER_LCA",   :limit => 2
    t.integer  "DISAB",        :limit => 2
    t.integer  "Score",        :limit => 2
    t.integer  "STATUS",       :limit => 2
    t.datetime "MDTDATE"
    t.integer  "DOSES",        :limit => 2
    t.integer  "SMEARF",       :limit => 2
    t.datetime "SMEARFDATE"
    t.integer  "SMEARL",       :limit => 2
    t.datetime "SMEARLDATE"
    t.datetime "RFT_DATE"
    t.integer  "FINAL_ASS",    :limit => 1
    t.datetime "FINAL_DATE"
    t.integer  "FDISAB",       :limit => 2
    t.integer  "FDEF_WHO_G",   :limit => 2
    t.integer  "OUT",          :limit => 2
    t.integer  "Checked",      :limit => 1
    t.string   "Remarks",      :limit => 50, :null => false
  end

  add_index "tpatient1_start", ["Age"], :name => "ix_age"
  add_index "tpatient1_start", ["CLINIC_NUM"], :name => "ix_clinic_num"
  add_index "tpatient1_start", ["GdnName"], :name => "ix_gdnname"
  add_index "tpatient1_start", ["Name"], :name => "ix_name"
  add_index "tpatient1_start", ["REG_DATE"], :name => "ix_reg_date"
  add_index "tpatient1_start", ["REG_MAIN"], :name => "ix_tpatient1", :unique => true
  add_index "tpatient1_start", ["Remarks"], :name => "ix_remarks", :length => {"Remarks"=>20}
  add_index "tpatient1_start", ["YOB"], :name => "ix_yob"
  add_index "tpatient1_start", ["loc_Village"], :name => "ix_loc_village"

  create_table "tpatient_testing", :force => true do |t|
    t.datetime "LastUpdate",                 :null => false
    t.integer  "CLINIC_NUM"
    t.integer  "REG_MAIN"
    t.integer  "PID"
    t.integer  "Research",     :limit => 1
    t.string   "Name",         :limit => 25
    t.integer  "Age"
    t.integer  "YOB",          :limit => 2
    t.datetime "DOB"
    t.integer  "DURATION_Y",   :limit => 2
    t.integer  "DURATION_M",   :limit => 2
    t.integer  "Gender",       :limit => 2
    t.integer  "Occupation",   :limit => 2
    t.datetime "REG_DATE"
    t.datetime "entrydate"
    t.integer  "Guardian",     :limit => 2
    t.string   "GdnName",      :limit => 25
    t.integer  "loc_Dist"
    t.integer  "loc_Upo"
    t.integer  "loc_Uni"
    t.string   "loc_Village",  :limit => 15
    t.string   "Phonenr",      :limit => 15
    t.integer  "perm_Dist"
    t.integer  "perm_Upo"
    t.integer  "perm_Uni"
    t.string   "perm_Village", :limit => 15
    t.float    "perm_Latt"
    t.float    "perm_Long"
    t.integer  "Csdone",       :limit => 1
    t.datetime "CONTACTLST"
    t.datetime "CONTACTPLN"
    t.integer  "REACTION",     :limit => 1
    t.integer  "TYPE",         :limit => 2
    t.integer  "GROUP",        :limit => 2
    t.integer  "DETECT",       :limit => 2
    t.integer  "Referred",     :limit => 2
    t.integer  "HW_NUM",       :limit => 2
    t.integer  "FINDER_LCA",   :limit => 2
    t.integer  "DISAB",        :limit => 2
    t.integer  "Score",        :limit => 2
    t.integer  "STATUS",       :limit => 2
    t.datetime "MDTDATE"
    t.integer  "DOSES",        :limit => 2
    t.integer  "SMEARF",       :limit => 2
    t.datetime "SMEARFDATE"
    t.integer  "SMEARL",       :limit => 2
    t.datetime "SMEARLDATE"
    t.datetime "RFT_DATE"
    t.integer  "FINAL_ASS",    :limit => 1
    t.datetime "FINAL_DATE"
    t.integer  "FDISAB",       :limit => 2
    t.integer  "FDEF_WHO_G",   :limit => 2
    t.integer  "OUT",          :limit => 2
    t.integer  "Checked",      :limit => 1
    t.string   "Remarks",      :limit => 50, :null => false
  end

  add_index "tpatient_testing", ["Age"], :name => "ix_age"
  add_index "tpatient_testing", ["CLINIC_NUM"], :name => "ix_clinic_num"
  add_index "tpatient_testing", ["GdnName"], :name => "ix_gdnname"
  add_index "tpatient_testing", ["Name"], :name => "ix_name"
  add_index "tpatient_testing", ["REG_DATE"], :name => "ix_reg_date"
  add_index "tpatient_testing", ["REG_MAIN"], :name => "ix_tpatient1", :unique => true
  add_index "tpatient_testing", ["Remarks"], :name => "ix_remarks", :length => {"Remarks"=>20}
  add_index "tpatient_testing", ["YOB"], :name => "ix_yob"
  add_index "tpatient_testing", ["loc_Village"], :name => "ix_loc_village"

  create_table "tpatientstudy", :force => true do |t|
    t.datetime "LastUpdate", :null => false
    t.integer  "REG_MAIN"
    t.integer  "PID"
    t.integer  "SID"
  end

  add_index "tpatientstudy", ["REG_MAIN", "SID", "PID"], :name => "ix_tpatientstudy", :unique => true

  create_table "treactions", :force => true do |t|
    t.datetime "LastUpdate",              :null => false
    t.integer  "REG_MAIN"
    t.integer  "REG_STUDY"
    t.datetime "DATE"
    t.binary   "TREATMENT",  :limit => 1
    t.integer  "DOSE",       :limit => 2
    t.integer  "REA_DUR",    :limit => 2
    t.binary   "REA_T1",     :limit => 1
    t.binary   "REA_TN",     :limit => 1
    t.binary   "REA_T2",     :limit => 1
    t.integer  "T1R_N",      :limit => 2
    t.integer  "T2R",        :limit => 2
    t.datetime "PED_DATE"
    t.integer  "NLESIONS",   :limit => 2
    t.integer  "RNER_FAC_R", :limit => 2
    t.integer  "RNER_FAC_L", :limit => 2
    t.integer  "RNER_RAD_R", :limit => 2
    t.integer  "RNER_RAD_L", :limit => 2
    t.integer  "RNER_ULN_R", :limit => 2
    t.integer  "RNER_ULN_L", :limit => 2
    t.integer  "RNER_MED_R", :limit => 2
    t.integer  "RNER_MED_L", :limit => 2
    t.integer  "RNER_COM_R", :limit => 2
    t.integer  "RNER_COM_L", :limit => 2
    t.integer  "RNER_POS_R", :limit => 2
    t.integer  "RNER_POS_L", :limit => 2
    t.integer  "STAT",       :limit => 2
  end

  add_index "treactions", ["REG_MAIN", "DATE"], :name => "ix_treactions", :unique => true

  create_table "tstudies", :force => true do |t|
    t.datetime "LastUpdate",                   :null => false
    t.integer  "SID"
    t.string   "RegMain_grp",    :limit => 50
    t.integer  "MinOfREG_MAIN"
    t.integer  "MaxOfREG_MAIN"
    t.integer  "N_inUse"
    t.datetime "MinOfREG_DATE"
    t.datetime "MaxOfREG_DATE"
    t.integer  "MinOfREG_STUDY"
    t.integer  "MaxOfREG_STUDY"
    t.string   "StudyName",      :limit => 25
    t.string   "StudyDescr"
    t.string   "Studynr_start",  :limit => 25
    t.string   "Studynr_end",    :limit => 25
  end

  add_index "tstudies", ["SID"], :name => "ix_tstudies", :unique => true
  add_index "tstudies", ["StudyName"], :name => "ix_studyname"

end
