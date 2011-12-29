# /usr/bin/env ruby
#
# Read the legacy database tables into the new schema
#
# Copyright (C) 2011 Pjotr Prins <pjotr.prins@thebird.nl>

CREATE=false
LIMIT=10

require 'active_record'
require 'mysql2'

ROOT = File.join(File.dirname(__FILE__), '..', '..')
['/lib', '/db', '/db/old'].each do |folder|
  $:.unshift File.join(ROOT, folder)
end

ActiveRecord::Base.configurations = YAML::load(IO.read('../../config/database.yml'))
ActiveRecord::Base.establish_connection('development')
 
if CREATE
  require 'schema'
end

class People < ActiveRecord::Base
end

class PersonalHistory < ActiveRecord::Base 
end

class Contact < ActiveRecord::Base
end

class Assessment < ActiveRecord::Base
end

class Reaction < ActiveRecord::Base
end

class Address < ActiveRecord::Base
end

class Location < ActiveRecord::Base
end

class SymbolLookup < ActiveRecord::Base 
end

Contact.delete_all
Assessment.delete_all

print People.count," records in Lepra2:People\n"
print PersonalHistory.count," records in Lepra2:PersonalHistory\n"
print Contact.count," records in Lepra2:Contact\n"
print Address.count," records in Lepra2:Address\n"
print Location.count," records in Lepra2:Location\n"
print SymbolLookup.count," records in Lepra2:SymbolLookup\n"

# require 'lepra0_schema'
# require 'lepra1_schema'

class Lepra0Base < ActiveRecord::Base
  establish_connection(
    :adapter => "mysql2",
      :host => "localhost",
      :username => "root",
      :password => "mydbparrot",
      :database => "lepra0"
    )
end

class Lepra1Base < ActiveRecord::Base
  establish_connection(
    :adapter => "mysql2",
      :host => "localhost",
      :username => "root",
      :password => "mydbparrot",
      :database => "lepra1"
    )
end

class Lepra0_1 < Lepra0Base
  set_table_name "lepra1"
end
class Lepra0_2 < Lepra0Base
  set_table_name "lepra2"
end


class Lepra1PatientStart < Lepra1Base
  set_table_name "tpatient1_start"
end

class Lepra1Lookup < Lepra1Base
  set_table_name "tlookup"
end


# Symbols
SYMBOL = {
  detect: 'detection',
  disab:  'disability'
}

def check_column obj, name
  if !obj.class.columns_hash()[name]
    p obj.class.columns
    raise "Unknown #{obj.class}.#{name}"
  end
end

def walk hash, dest, src
  hash.each do | k, v |
    check_column(src,k)
    value = src.send(k.to_sym)
    value = nil if value == ''
    dest.send(v.to_s+'=',value)
  end
end

def walk_i hash, dest, src
  hash.each do | k, v |
    check_column(src,k)
    dest.send(v.to_s+'=',src.send(k.to_sym).to_i)
  end
end

def walk_b hash, dest, src
  hash.each do | k, v |
    check_column(src,k)
    value = src[k] == "\x01"
    dest.send(v.to_s+'=',value)
  end
end

PERSONALHISTORY_LEPRA0_1 = {
  'FINDER_LCA' => :finder_lca,
  'OCCUP' => :symbol_occupation,
  # '?' => :symbol_guardian,
}
CONTACT_LEPRA0_1 = {
  'CLINIC_NUM' => :clinic_id,
  'HW_NUM'     => :staff_id,
  'DETECT'     => :symbol_detection,
  'REFERRED'     => :symbol_referred,
  'TYPE'       => :symbol_patient_type,
  'OUT'        => :symbol_patient_status,
  'GROUP'      => :symbol_treatment,
  'MDTDATE'    => :mdt_date,
  'CONTACTPLN' => :contact_planned,
  'SMEARFDATE'    => :smearf_date,
  'SMEARLDATE'    => :smear_date,
  'RFT_DATE'    => :rft_date,
  'CHRONICDIS'   => :symbol_chronic_disability,
  # 'PRE_DATE'    => :rft_date, in LEPRA3
}
CONTACT_LEPRA0_1_INT = {
  'DISAB'   => :symbol_who_disability,
  'DOSES'   => :mdt_dose,
  'SMEARF'   => :symbol_smearf,
  'SMEARL'   => :symbol_smear,
  'HW_NUM' => :health_worker,
  'DURATION_Y' => :duration_years,
  'DURATION_M' => :duration_months,
  'YOUNG_Y' => :young_years,
  'YOUNG_M' => :young_months,
  'LESIONS' => :lesions,
  'BCG_SCAR' => :bcg_scar,
}
CONTACT_LEPRA0_1_BOOL = {
  'FINAL_ASS'  => :final_assessment,
  'DEF_SURREH' => :surgical_rehab,
  'DEF_SE_REH' => :social_rehab,
}

CONTACT_LEPRA0_2 = {
  'disease_s' => :symbol_disease_descr,
  'h_otherstr' => :hospital_specify
}
CONTACT_LEPRA0_2_INT = {
}
CONTACT_LEPRA0_2_BOOL = {
  'trauma' => :trauma_operation,
  'disease' => :disease,
  'diy' => :diy,
  'hosp' => :hospital_admission,
  'neuritus' => :hospital_neuritis,
  'plantar_ul' => :hospital_plantar_alcer,
  'eye_compl' => :hospital_eye_complication,
  'h_other' => :hospital_other,
  'pre_dose'   => :prednisolon,
  'pregnant'   => :pregnant,
  'pregn_date' => :pregnancy_date,
  'breastfeed' => :breast_feeding,   
}

ASSESSMENT_LEPRA0_1 = {
}
ASSESSMENT_LEPRA0_1_INT = {
  'PREV_NER_D' =>     :num_nerve_damage_prev,
}
ASSESSMENT_LEPRA0_1_BOOL = {
    'LES_INFLAM' => :lesions_inflam,
    'LES_FACE'   => :lesions_face,
    'LES_ARM_R'  => :lesions_arm_r,
    'LES_ARM_L'  => :lesions_arm_l,
    'LES_TRUNK'  => :lesions_trunk,
    'LES_LEG_R'  => :lesions_leg_r,
    'LES_LEG_L'  => :lesions_leg_l,
    'OED_HANDS'  => :oed_hands,
    'OED_FEET'   => :oed_feed,
    'DEF_HAG_R'  =>        :deformity_hag_r,     # Lagophtalmos
    'DEF_HAG_L'  =>        :deformity_hag_l,
    'DEF_FAC_R'  =>        :deformity_facial_r,  # Facialpalsy 
    'DEF_FAC_L'  =>        :deformity_facial_l , # Facialpalsy 
    'DEF_CLA_HR'  =>        :deformity_claw_hand_r, 
    'DEF_CLA_HL'  =>        :deformity_claw_hand_l, 
    'DEF_APE_R'    =>        :deformity_ape_thumb_r ,
    'DEF_APE_L'  =>        :deformity_ape_thumb_l,  
    'DEF_WRIS_R'  =>        :deformity_wrist_drop_r ,
    'DEF_WRIS_L'  =>        :deformity_wrist_drop_l ,
    'DEF_FOOT_R'  =>        :deformity_foot_drop_r,
    'DEF_FOOT_L'  =>        :deformity_foot_drop_l ,
    'DEF_CLA_TR'  =>        :deformity_claw_toes_r   ,
    'DEF_CLA_TL'   =>        :deformity_claw_toes_l   ,
    'DEF_ABS_FR'  =>        :deformity_absent_finger_r ,
    'DEF_ABS_FL'  =>        :deformity_absent_finger_l ,
    'DEF_ABS_TR'  =>        :deformity_absent_toes_r,
    'DEF_ABS_TL'  =>        :deformity_absent_toes_l,
    'DEF_PA_L'  =>        :deformity_palmar_r, # Palmar Anaesthetic
    'DEF_PA_R'  =>        :deformity_palmar_l,
    'DEF_PLA_L'    =>        :deformity_planter_r, # Planter Anaesthetic
    'DEF_PLA_R' =>       :deformity_planter_l,
          
  'NER_FAC_ER' =>      :nerve_facial_enlarged_r,
  'NER_FAC_EL' =>     :nerve_facial_enlarged_l,
  'NER_FAC_TR' =>     :nerve_facial_tender_r,
  'NER_FAC_TL' =>     :nerve_facial_tender_l,
  'NER_RAD_ER' =>      :nerve_radial_enlarged_r, # Enlarged radial
  'NER_RAD_EL' =>     :nerve_radial_enlarged_l,
  'NER_RAD_TR' =>     :nerve_radial_tender_r,  # Tender/pain radia 
  'NER_RAD_TL' =>     :nerve_radial_tender_l,
  'NER_ULN_ER' =>      :nerve_ulcer_enlarged_r,
  'NER_ULN_EL' =>     :nerve_ulcer_enlarged_l,
  'NER_ULN_TR' =>     :nerve_ulcer_tender_r,
  'NER_ULN_TL' =>     :nerve_ulcer_tender_l,
  'NER_MED_ER' =>      :nerve_median_enlarged_r,
  'NER_MED_EL' =>     :nerve_median_enlarged_l,
  'NER_MED_TR' =>     :nerve_median_tender_r,
  'NER_MED_TL' =>     :nerve_median_tender_l,
  'NER_COM_ER' =>      :nerve_common_enlarged_r,
  'NER_COM_EL' =>     :nerve_common_enlarged_l,
  'NER_COM_TR' =>     :nerve_common_tender_r,
  'NER_COM_TL' =>     :nerve_common_tender_l,
  'NER_POS_ER' =>      :nerve_posterior_enlarged_r,
  'NER_POS_EL' =>     :nerve_posterior_enlarged_l,
  'NER_POS_TR' =>     :nerve_posterior_tender_r,
  'NER_POS_TL' =>     :nerve_posterior_tender_l,

}

           
ASSESSMENT_LEPRA0_2 = {
}

ASSESSMENT_LEPRA0_2_INT = {
  'ulcs_num' =>  :ulcers ,
 'st_hand_r' =>     :sensory_score_hand_r,
 'st_hand_l' =>     :sensory_score_hand_l,
 'st_foot_r' =>     :sensory_score_foot_r,
 'st_foot_l' =>     :sensory_score_foot_l,
 'st_eye_r' =>      :sensory_score_eye_r,
 'st_eye_l' =>      :sensory_score_eye_l,
  'qmt_ey_sr' =>     :qmt_eye_closure_strength_r, # 'qmt_Light eye closure (strength) Right
  'qmt_ey_sl' =>     :qmt_eye_closure_strength_l,  # 'qmt_Light eye closure (strength) Left
  'qmt_ey_gr' =>     :qmt_eye_closure_gap_r,      # 'qmt_Light eye closure (gap) Right
  'qmt_ey_gl' =>     :qmt_eye_closure_gap_l,       # 'qmt_Light eye closure (gap) Left
  'qmt_lf_ar' =>     :qmt_little_finger_r,        # 'qmt_Little finger abd(ADM) Right
  'qmt_lf_al' =>     :qmt_little_finger_l,         # 'qmt_Little finger abd(ADM) Left
  'qmt_th_ar' =>     :qmt_thumb_r,                # 'qmt_Thumb abd(APB) Right
  'qmt_th_al' =>     :qmt_thumb_l,                 # 'qmt_Thumb abd(APB) Left
  'qmt_wr_er' =>     :qmt_wrist_r,                # 'qmt_Wrist extension Right
  'qmt_wr_el' =>     :qmt_wrist_l,                 # 'qmt_Wrist extension Left
  'qmt_do_r' =>      :qmt_dorsiflexion_foot_r,    # 'qmt_Dorsiflexion Right foot
  'qmt_do_l' =>      :qmt_dorsiflexion_foot_l,     # 'qmt_Dorsiflexion Left foot
}

ASSESSMENT_LEPRA0_2_BOOL = {
  

  'ulcs_pal_r' =>     :ulcers_palm_simple_r,
  'ulcs_pal_l' =>     :ulcers_palm_simple_l,
  'ulcs_sol_r' =>     :ulcers_sole_simple_r,
  'ulcs_sol_l' =>     :ulcers_sole_simple_l,
  'ulcc_pal_r' =>     :ulcers_palm_complicated_r,
  'ulcc_pal_l' =>     :ulcers_palm_complicated_l,
  'ulcc_sol_r' =>     :ulcers_sole_complicated_r,
  'ulcc_sol_l' =>     :ulcers_sole_complicated_l,
  'ulcm_pal_r' =>     :ulcers_palm_malignant_r,
  'ulcm_pal_l' =>     :ulcers_palm_malignant_l,
  'ulcm_sol_r' =>     :ulcers_sole_malignant_r,
  'ulcm_sol_l' =>     :ulcers_sole_malignant_l,
  'ulci_pal_r' =>     :ulcers_palm_infected_r,
  'ulci_pal_l' =>     :ulcers_palm_infected_l,
  'ulci_sol_r' =>     :ulcers_sole_infected_r,
  'ulci_sol_l' =>     :ulcers_sole_infected_l,

  'shr01'   =>  sensitivity_hand_r01
  'shr02'   =>  sensitivity_hand_r02
  'shr03'   =>  sensitivity_hand_r03
  'shr04'   =>  sensitivity_hand_r04
  'shr05'   =>  sensitivity_hand_r05
  'shr06'   =>  sensitivity_hand_r06
  'shr07'   =>  sensitivity_hand_r07
  'shr08'   =>  sensitivity_hand_r08
  'shr09'   =>  sensitivity_hand_r09
  'shr10'   =>  sensitivity_hand_r10
  'shr11'   =>  sensitivity_hand_r11
  'shr12'   =>  sensitivity_hand_r12
  'shl01'   =>  sensitivity_hand_l01
  'shl02'   =>  sensitivity_hand_l02
  'shl03'   =>  sensitivity_hand_l03
  'shl04'   =>  sensitivity_hand_l04
  'shl05'   =>  sensitivity_hand_l05
  'shl06'   =>  sensitivity_hand_l06
  'shl07'   =>  sensitivity_hand_l07
  'shl08'   =>  sensitivity_hand_l08
  'shl09'   =>  sensitivity_hand_l09
  'shl10'   =>  sensitivity_hand_l10
  'shl11'   =>  sensitivity_hand_l11
  'shl12'   =>  sensitivity_hand_l12
  'sfr01'   =>  sensitivity_foot_r01
  'sfr02'   =>  sensitivity_foot_r02
  'sfr03'   =>  sensitivity_foot_r03
  'sfr04'   =>  sensitivity_foot_r04
  'sfr05'   =>  sensitivity_foot_r05
  'sfr06'   =>  sensitivity_foot_r06
  'sfr07'   =>  sensitivity_foot_r07
  'sfr08'   =>  sensitivity_foot_r08
  'sfr09'   =>  sensitivity_foot_r09
  'sfr10'   =>  sensitivity_foot_r10
  'sfr11'   =>  sensitivity_foot_r11
  'sfl01'   =>  sensitivity_foot_l01
  'sfl02'   =>  sensitivity_foot_l02
  'sfl03'   =>  sensitivity_foot_l03
  'sfl04'   =>  sensitivity_foot_l04
  'sfl05'   =>  sensitivity_foot_l05
  'sfl06'   =>  sensitivity_foot_l06
  'sfl07'   =>  sensitivity_foot_l07
  'sfl08'   =>  sensitivity_foot_l08
  'sfl09'   =>  sensitivity_foot_l09
  'sfl10'   =>  sensitivity_foot_l10
  'sfl11'   =>  sensitivity_foot_l11
}


def new_assessment(contact, lepra1, lepra2) 
  assess = Assessment.new
  assess.person_id = contact.person_id
  assess.contact_id = contact.id
  walk(ASSESSMENT_LEPRA0_1,assess,lepra1)
  walk_i(ASSESSMENT_LEPRA0_1_INT,assess,lepra1)
  walk_b(ASSESSMENT_LEPRA0_1_BOOL,assess,lepra1)
  walk(ASSESSMENT_LEPRA0_2,assess,lepra2)
  walk_i(ASSESSMENT_LEPRA0_2_INT,assess,lepra2)
  walk_b(ASSESSMENT_LEPRA0_2_BOOL,assess,lepra2)
  print "  - Adding ",assess.person_id," to Assessment\n"
  assess.save
end

Lepra1Lookup.find(:all).each do | rec |
  lookup = 
    if not SymbolLookup.exists?(rec.id)
      SymbolLookup.new
    else
      SymbolLookup.find(rec.id)
    end
  lookup.id = rec.id
  name = rec.Variable.downcase
  lookup.name = name
  name1 = name.to_sym
  lookup.name = SYMBOL[name1] if SYMBOL[name1]
  lookup.value = rec.Value
  lookup.description = rec.Label if rec.Label
  lookup.rank = rec.ValueNum
  lookup.save
end

# Patients
Lepra0_1.find(:all, :limit=>LIMIT).each do | rec |
  # if not People.exists?(rec.id)
    person = People.find_or_initialize_by_id(rec.id)
    # person = People.new
    person.id = rec.id
    person.name = rec['PATIENT']
    person.registration = rec['REG_MAIN'].to_i.to_s
    reg_study = rec['REG_STUDY']
    if reg_study == nil or rec['REG_STUDY'] == '0.0'
      person.reg_study = rec['REG_STUDY'].to_i.to_s
    end
    person.year_of_birth = rec['BIRTH']
    person.male = rec['SEX'] != "F"
    person.fathers_name = nil
    # address
    address = 
      if not Address.exists?(:village => rec.VILLAGE, :clinic_id => rec.CLINIC_NUM)
        addr = Address.new
        addr.village = rec.VILLAGE
        addr.clinic_id = rec.CLINIC_NUM
        addr.road = ''
        addr.save
        addr
      else
        Address.find_by_village_and_clinic_id(rec.VILLAGE,rec.CLINIC_NUM)
      end  
    # location
    location = 
      if not Location.exists?(:village => rec.VILLAGE, :district => rec.DIST, 
                              :upozilla => rec.REG_UPO)
        loc = Location.new
        loc.clinic_id = rec.CLINIC_NUM
        loc.village = rec.VILLAGE
        loc.upozilla = rec.REG_UPO
        loc.clinic_id = rec.CLINIC_NUM
        loc.district = rec.DIST.to_i.to_s if rec.DIST
        # loc.union = rec.UNION
        loc.upozilla = rec.REG_UPO.to_i.to_s if rec.REG_UPO
        loc.save
        loc
      else
        loc = Location.find_by_village_and_district(rec.VILLAGE, rec.DIST)
        loc
      end  
    address.location_id = location.id
    address.save

    # personal history
    hist = PersonalHistory.find_or_initialize_by_id(person.id)
    hist.id = person.id
    hist.person_id = person.id
    hist.created_at = rec.REG_DATE
    hist.updated_at = rec.CONTACTLST
    hist.registration_date = rec.REG_DATE
    hist.staff_id = rec.HW_NUM  # staff who registered
    # hist.finder_id = rec.FINDER_LCA if rec.FINDER_LCA and rec.FINDER_LCA > 0
    # hist.symbol_occupation = rec.OCCUP
    hist.symbol_education = rec.EDUCAT.to_i.to_s if rec.EDUCAT
    # hist.guardian  FIXME
    hist.members = rec.HMEMBER
    hist.income = rec.HINCOME
    walk(PERSONALHISTORY_LEPRA0_1,hist,rec)
    print "Updating ",person.id," ",person.name," to PersonalHistory\n"
    hist.save
    address2 = Address.find(address.id)
    address2.personal_history_id = hist.id
    address2.save
    # There is always one or more contacts, first create a contact
    # from lepra0_1 rec
    contact = Contact.create
    contact.updated_at = rec.CONTACTLST
    contact.date = rec.CONTACTLST
    contact.person_id = person.id
    contact.symbol_medication = rec.STATUS.to_i.to_s if rec.STATUS
    walk(CONTACT_LEPRA0_1,contact,rec)
    walk_i(CONTACT_LEPRA0_1_INT,contact,rec)
    walk_b(CONTACT_LEPRA0_1_BOOL,contact,rec)
    # fill with the first lepra0_2 form
    lepra2 = Lepra0_2.where('REG_MAIN = '+rec.REG_MAIN.to_i.to_s).first
    if lepra2
      print "- found Lepra2 form\n"
      walk(CONTACT_LEPRA0_2,contact,lepra2)
      walk_i(CONTACT_LEPRA0_2_INT,contact,lepra2)
      walk_b(CONTACT_LEPRA0_2_BOOL,contact,lepra2)
      new_assessment(contact,rec,lepra2)
    end
    # save
    print "- Adding ",person.id," to Contact\n"
    contact.save
    contact = nil

    # for every additional lepra0_2 rec, add a contact
    if lepra2
      lepra2 = nil
      Lepra0_2.where('REG_MAIN = '+rec.REG_MAIN.to_i.to_s)[1..-1].each do | lepra2_n |
        p lepra2_n.id
        contact_n = Contact.create
        # date = lepra2_n.date
        date = rec.CONTACTLST 
        contact_n.date = date
        contact_n.updated_at = date
        contact_n.person_id = person.id
        contact_n.symbol_medication = rec.STATUS.to_i.to_s if rec.STATUS
        walk(CONTACT_LEPRA0_1,contact_n,rec)
        walk_i(CONTACT_LEPRA0_1_INT,contact_n,rec)
        walk_b(CONTACT_LEPRA0_1_BOOL,contact_n,rec)
        walk(CONTACT_LEPRA0_2,contact_n,lepra2_n)
        walk_i(CONTACT_LEPRA0_2_INT,contact_n,lepra2_n)
        walk_b(CONTACT_LEPRA0_2_BOOL,contact_n,lepra2_n)
        print "- Adding another ",person.id," to Contact\n"
        contact_n.save
        new_assessment(contact_n,rec,lepra2_n)
      end
    end
    print "Updating ",person.id," ",person.name," to People\n"
    person.save
  # end  
end


