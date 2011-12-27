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

  create_table "lepra1", :force => true do |t|
    t.timestamp "LastUpdate",                                :null => false
    t.float     "REG_UPO"
    t.float     "REG_MAIN",                 :default => 0.0, :null => false
    t.float     "REG_STUDY"
    t.datetime  "REG_DATE"
    t.binary    "CHECKED",    :limit => 1
    t.binary    "REG_ONLY",   :limit => 1
    t.binary    "REACTION",   :limit => 1
    t.datetime  "REA_DATE"
    t.float     "REACTIONS"
    t.string    "PATIENT",    :limit => 15
    t.string    "VILLAGE",    :limit => 15
    t.float     "BIRTH"
    t.string    "SEX",        :limit => 1
    t.string    "OCCUP",      :limit => 2
    t.float     "EDUCAT"
    t.float     "HMEMBER"
    t.float     "HINCOME"
    t.string    "TYPE",       :limit => 2
    t.string    "GROUP",      :limit => 2
    t.string    "DETECT",     :limit => 1
    t.string    "VDETECT",    :limit => 2
    t.string    "REFERRED",   :limit => 1
    t.binary    "CONTACT",    :limit => 1
    t.string    "OUT",        :limit => 1
    t.float     "DISAB"
    t.float     "STATUS"
    t.float     "DOSES"
    t.datetime  "MDTDATE"
    t.float     "SMEARF"
    t.datetime  "SMEARFDATE"
    t.float     "SMEARL"
    t.datetime  "SMEARLDATE"
    t.float     "OTHER"
    t.float     "DIST"
    t.datetime  "CONTACTLST"
    t.datetime  "CONTACTPLN"
    t.datetime  "RFT_DATE"
    t.float     "CLINIC_NUM"
    t.float     "HW_NUM"
    t.float     "FINDER_LCA"
    t.binary    "BCG_SCAR",   :limit => 1
    t.string    "CHRONICDIS", :limit => 4
    t.binary    "TRAU_OPER",  :limit => 1
    t.float     "DURATION_Y"
    t.float     "DURATION_M"
    t.float     "YOUNG_Y"
    t.float     "YOUNG_M"
    t.float     "LESIONS"
    t.binary    "LES_INFLAM", :limit => 1
    t.binary    "LES_FACE",   :limit => 1
    t.binary    "LES_ARM_R",  :limit => 1
    t.binary    "LES_ARM_L",  :limit => 1
    t.binary    "LES_TRUNK",  :limit => 1
    t.binary    "LES_LEG_R",  :limit => 1
    t.binary    "LES_LEG_L",  :limit => 1
    t.binary    "OED_HANDS",  :limit => 1
    t.binary    "OED_FEET",   :limit => 1
    t.binary    "DEF_HAG_R",  :limit => 1
    t.binary    "DEF_HAG_L",  :limit => 1
    t.binary    "DEF_FAC_R",  :limit => 1
    t.binary    "DEF_FAC_L",  :limit => 1
    t.binary    "DEF_CLA_HR", :limit => 1
    t.binary    "DEF_CLA_HL", :limit => 1
    t.binary    "DEF_APE_R",  :limit => 1
    t.binary    "DEF_APE_L",  :limit => 1
    t.binary    "DEF_WRIS_R", :limit => 1
    t.binary    "DEF_WRIS_L", :limit => 1
    t.binary    "DEF_FOOT_R", :limit => 1
    t.binary    "DEF_FOOT_L", :limit => 1
    t.binary    "DEF_CLA_TR", :limit => 1
    t.binary    "DEF_CLA_TL", :limit => 1
    t.binary    "DEF_ABS_FR", :limit => 1
    t.binary    "DEF_ABS_FL", :limit => 1
    t.binary    "DEF_ABS_TR", :limit => 1
    t.binary    "DEF_ABS_TL", :limit => 1
    t.binary    "DEF_PA_L",   :limit => 1
    t.binary    "DEF_PA_R",   :limit => 1
    t.binary    "DEF_PLA_L",  :limit => 1
    t.binary    "DEF_PLA_R",  :limit => 1
    t.binary    "DEF_SURREH", :limit => 1
    t.binary    "DEF_SE_REH", :limit => 1
    t.float     "NLESIONS"
    t.float     "PREV_NER_D"
    t.float     "NER_FAC_ER"
    t.float     "NER_FAC_EL"
    t.float     "NER_FAC_TR"
    t.float     "NER_FAC_TL"
    t.float     "NER_RAD_ER"
    t.float     "NER_RAD_EL"
    t.float     "NER_RAD_TR"
    t.float     "NER_RAD_TL"
    t.float     "NER_ULN_ER"
    t.float     "NER_ULN_EL"
    t.float     "NER_ULN_TR"
    t.float     "NER_ULN_TL"
    t.float     "NER_MED_ER"
    t.float     "NER_MED_EL"
    t.float     "NER_MED_TR"
    t.float     "NER_MED_TL"
    t.float     "NER_COM_ER"
    t.float     "NER_COM_EL"
    t.float     "NER_COM_TR"
    t.float     "NER_COM_TL"
    t.float     "NER_POS_ER"
    t.float     "NER_POS_EL"
    t.float     "NER_POS_TR"
    t.float     "NER_POS_TL"
    t.binary    "FINAL_ASS",  :limit => 1
    t.datetime  "FINAL_DATE"
    t.float     "FDISAB"
    t.float     "FDEF_WHO_G"
    t.binary    "FDEF_HAG_R", :limit => 1
    t.binary    "FDEF_HAG_L", :limit => 1
    t.binary    "FDEF_FAC_R", :limit => 1
    t.binary    "FDEF_FAC_L", :limit => 1
    t.binary    "FDEF_CLAHR", :limit => 1
    t.binary    "FDEF_CLAHL", :limit => 1
    t.binary    "FDEF_APE_R", :limit => 1
    t.binary    "FDEF_APE_L", :limit => 1
    t.binary    "FDEF_WRI_R", :limit => 1
    t.binary    "FDEF_WRI_L", :limit => 1
    t.binary    "FDEF_FOO_R", :limit => 1
    t.binary    "FDEF_FOO_L", :limit => 1
    t.binary    "FDEF_CLATR", :limit => 1
    t.binary    "FDEF_CLATL", :limit => 1
    t.binary    "FDEF_ABSFR", :limit => 1
    t.binary    "FDEF_ABSFL", :limit => 1
    t.binary    "FDEF_ABSTR", :limit => 1
    t.binary    "FDEF_ABSTL", :limit => 1
    t.binary    "FDEF_PA_L",  :limit => 1
    t.binary    "FDEF_PA_R",  :limit => 1
    t.binary    "FDEF_PLA_L", :limit => 1
    t.binary    "FDEF_PLA_R", :limit => 1
    t.binary    "FDEF_SURRE", :limit => 1
    t.binary    "FDEF_SE_RE", :limit => 1
  end

  add_index "lepra1", ["REG_MAIN"], :name => "Ix_RegMain", :unique => true

  create_table "lepra2", :force => true do |t|
    t.integer "reg_main"
    t.integer "reg_study"
    t.date    "date"
    t.integer "lca"
    t.integer "mdt_dose"
    t.integer "ulcs_num"
    t.boolean "ulcs_pal_r"
    t.boolean "ulcs_pal_l"
    t.boolean "ulcs_sol_r"
    t.boolean "ulcs_sol_l"
    t.boolean "ulcc_pal_r"
    t.boolean "ulcc_pal_l"
    t.boolean "ulcc_sol_r"
    t.boolean "ulcc_sol_l"
    t.boolean "ulcm_pal_r"
    t.boolean "ulcm_pal_l"
    t.boolean "ulcm_sol_r"
    t.boolean "ulcm_sol_l"
    t.boolean "ulci_pal_r"
    t.boolean "ulci_pal_l"
    t.boolean "ulci_sol_r"
    t.boolean "ulci_sol_l"
    t.integer "st_hand_r"
    t.integer "st_hand_l"
    t.integer "st_foot_r"
    t.integer "st_foot_l"
    t.integer "st_eye_r"
    t.integer "st_eye_l"
    t.boolean "shr01"
    t.boolean "shr02"
    t.boolean "shr03"
    t.boolean "shr04"
    t.boolean "shr05"
    t.boolean "shr06"
    t.boolean "shr07"
    t.boolean "shr08"
    t.boolean "shr09"
    t.boolean "shr10"
    t.boolean "shr11"
    t.boolean "shr12"
    t.boolean "shl01"
    t.boolean "shl02"
    t.boolean "shl03"
    t.boolean "shl04"
    t.boolean "shl05"
    t.boolean "shl06"
    t.boolean "shl07"
    t.boolean "shl08"
    t.boolean "shl09"
    t.boolean "shl10"
    t.boolean "shl11"
    t.boolean "shl12"
    t.boolean "sfr01"
    t.boolean "sfr02"
    t.boolean "sfr03"
    t.boolean "sfr04"
    t.boolean "sfr05"
    t.boolean "sfr06"
    t.boolean "sfr07"
    t.boolean "sfr08"
    t.boolean "sfr09"
    t.boolean "sfr10"
    t.boolean "sfr11"
    t.boolean "sfl01"
    t.boolean "sfl02"
    t.boolean "sfl03"
    t.boolean "sfl04"
    t.boolean "sfl05"
    t.boolean "sfl06"
    t.boolean "sfl07"
    t.boolean "sfl08"
    t.boolean "sfl09"
    t.boolean "sfl10"
    t.boolean "sfl11"
    t.integer "qmt_ey_sr"
    t.integer "qmt_ey_sl"
    t.integer "qmt_ey_gr"
    t.integer "qmt_ey_gl"
    t.integer "qmt_lf_ar"
    t.integer "qmt_lf_al"
    t.integer "qmt_th_ar"
    t.integer "qmt_th_al"
    t.integer "qmt_wr_er"
    t.integer "qmt_wr_el"
    t.integer "qmt_do_r"
    t.integer "qmt_do_l"
    t.boolean "trauma"
    t.boolean "disease"
    t.string  "disease_s",  :limit => 2
    t.date    "pre_dose"
    t.boolean "pregnant"
    t.date    "pregn_date"
    t.boolean "breastfeed"
    t.boolean "hosp"
    t.boolean "neuritus"
    t.boolean "plantar_ul"
    t.boolean "eye_compl"
    t.boolean "h_other"
    t.string  "h_otherstr", :limit => 4
    t.integer "diy"
    t.string  "surgery1",   :limit => 2
    t.string  "surgery2",   :limit => 2
  end

  create_table "lepra3", :force => true do |t|
    t.timestamp "LastUpdate",              :null => false
    t.float     "REG_MAIN"
    t.float     "REG_STUDY"
    t.datetime  "DATE"
    t.binary    "TREATMENT",  :limit => 1
    t.float     "DOSE"
    t.float     "REA_DUR"
    t.binary    "REA_T1",     :limit => 1
    t.binary    "REA_TN",     :limit => 1
    t.binary    "REA_T2",     :limit => 1
    t.float     "T1R_N"
    t.float     "T2R"
    t.datetime  "PED_DATE"
    t.float     "NLESIONS"
    t.float     "RNER_FAC_R"
    t.float     "RNER_FAC_L"
    t.float     "RNER_RAD_R"
    t.float     "RNER_RAD_L"
    t.float     "RNER_ULN_R"
    t.float     "RNER_ULN_L"
    t.float     "RNER_MED_R"
    t.float     "RNER_MED_L"
    t.float     "RNER_COM_R"
    t.float     "RNER_COM_L"
    t.float     "RNER_POS_R"
    t.float     "RNER_POS_L"
    t.float     "STAT"
  end

  add_index "lepra3", ["DATE"], :name => "Ix_date"
  add_index "lepra3", ["REG_MAIN", "DATE"], :name => "Ix_Lepra3", :unique => true
  add_index "lepra3", ["REG_MAIN"], :name => "ix_Regmain"

end
