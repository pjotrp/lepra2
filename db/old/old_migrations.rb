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
    'DEF_CLA_HR'  =>        :deformity_claw_hand_r  , 
    'DEF_CLA_HL'  =>        :deformity_claw_hand_l  ,
    'DEF_APE_R'    =>        :deformity_ape_thumb_r ,
    'DEF_APE_L'  =>        :deformity_ape_thumb_l   ,
    'DEF_WRIS_R'  =>        :deformity_wrist_drop_r ,
    'DEF_WRIS_L'  =>        :deformity_wrist_drop_l ,
    'DEF_FOOT_R'  =>        :deformity_foot_drop_r  ,
    'DEF_FOOT_L'  =>        :deformity_foot_drop_l  ,
    'DEF_CLA_TR'  =>        :deformity_claw_toes_r     ,
    'DEF_CLA_TL'   =>        :deformity_claw_toes_l    ,
    'DEF_ABS_FR'  =>        :deformity_absent_finger_r ,
    'DEF_ABS_FL'  =>        :deformity_absent_finger_l ,
    'DEF_ABS_TR'  =>        :deformity_absent_toes_r,
    'DEF_ABS_TL'  =>        :deformity_absent_toes_l,
    'DEF_PA_L'  =>        :deformity_palmar_r, # Palmar Anaesthetic
    'DEF_PA_R'  =>        :deformity_palmar_l,
    'DEF_PLA_L'    =>        :deformity_planter_r, # Planter Anaesthetic
    'DEF_PLA_R' =>       :deformity_planter_l,
           
            
=begin
      
      :ulcers  
      :ulcers_palm_simple_r
      :ulcers_palm_simple_l
      :ulcers_sole_simple_r
      :ulcers_sole_simple_l
      :ulcers_palm_complicated_r
      :ulcers_palm_complicated_l
      :ulcers_sole_complicated_r
      :ulcers_sole_complicated_l
      :ulcers_palm_malignant_r
      :ulcers_palm_malignant_l
      :ulcers_sole_malignant_r
      :ulcers_sole_malignant_l
      :ulcers_palm_infected_r
      :ulcers_palm_infected_l
      :ulcers_sole_infected_r
      :ulcers_sole_infected_l

      
      :sensory_score_hand_r
      :sensory_score_hand_l
      :sensory_score_foot_r
      :sensory_score_foot_l
      :sensory_score_eye_r
      :sensory_score_eye_l

      mage
      :num_nerve_damage_prev
      :nerve_facial_enlarged_r
      :nerve_facial_enlarged_l
      :nerve_facial_tender_r
      :nerve_facial_tender_l
      :nerve_radial_enlarged_r # Enlarged radial
      :nerve_radial_enlarged_l
      :nerve_radial_tender_r  # Tender/pain radia 
      :nerve_radial_tender_l
      :nerve_ulcer_enlarged_r
      :nerve_ulcer_enlarged_l
      :nerve_ulcer_tender_r
      :nerve_ulcer_tender_l
      :nerve_median_enlarged_r
      :nerve_median_enlarged_l
      :nerve_median_tender_r
      :nerve_median_tender_l
      :nerve_common_enlarged_r
      :nerve_common_enlarged_l
      :nerve_common_tender_r
      :nerve_common_tender_l
      :nerve_posterior_enlarged_r
      :nerve_posterior_enlarged_l
      :nerve_posterior_tender_r
      :nerve_posterior_tender_l

      scle testing
      :qmt_eye_closure_strength_r   # QMT Light eye closure (strength) Right
      :qmt_eye_closure_strength_l   # QMT Light eye closure (strength) Left
      :qmt_eye_closure_gap_r        # QMT Light eye closure (gap) Right
      :qmt_eye_closure_gap_l        # QMT Light eye closure (gap) Left
      :qmt_little_finger_r          # QMT Little finger abd(ADM) Right
      :qmt_little_finger_l          # QMT Little finger abd(ADM) Left
      :qmt_thumb_r                  # QMT Thumb abd(APB) Right
      :qmt_thumb_l                  # QMT Thumb abd(APB) Left
      :qmt_wrist_r                  # QMT Wrist extension Right
      :qmt_wrist_l                  # QMT Wrist extension Left
      :qmt_dorsiflexion_foot_r      # QMT Dorsiflexion Right foot
      :qmt_dorsiflexion_foot_l      # QMT Dorsiflexion Left foot

      :sensitivity_hand_r01
      :sensitivity_hand_r01
      :sensitivity_hand_r02
      :sensitivity_hand_r03
      :sensitivity_hand_r04
      :sensitivity_hand_r05
      :sensitivity_hand_r06
      :sensitivity_hand_r07
      :sensitivity_hand_r08
      :sensitivity_hand_r09
      :sensitivity_hand_r10
      :sensitivity_hand_r11
      :sensitivity_hand_r12
      :sensitivity_hand_l01
      :sensitivity_hand_l01
      :sensitivity_hand_l02
      :sensitivity_hand_l03
      :sensitivity_hand_l04
      :sensitivity_hand_l05
      :sensitivity_hand_l06
      :sensitivity_hand_l07
      :sensitivity_hand_l08
      :sensitivity_hand_l09
      :sensitivity_hand_l10
      :sensitivity_hand_l11
      :sensitivity_hand_l12

      :sensitivity_foot_r01
      :sensitivity_foot_r01
      :sensitivity_foot_r02
      :sensitivity_foot_r03
      :sensitivity_foot_r04
      :sensitivity_foot_r05
      :sensitivity_foot_r06
      :sensitivity_foot_r07
      :sensitivity_foot_r08
      :sensitivity_foot_r09
      :sensitivity_foot_r10
      :sensitivity_foot_r11

      :sensitivity_foot_l01
      :sensitivity_foot_l01
      :sensitivity_foot_l02
      :sensitivity_foot_l03
      :sensitivity_foot_l04
      :sensitivity_foot_l05
      :sensitivity_foot_l06
      :sensitivity_foot_l07
      :sensitivity_foot_l08
      :sensitivity_foot_l09
      :sensitivity_foot_l10
      :sensitivity_foot_l11
=end

}

def new_assessment(contact, lepra1, lepra2) 
  assess = Assessment.new
  assess.person_id = contact.person_id
  assess.contact_id = contact.id
  walk(ASSESSMENT_LEPRA0_1,assess,lepra1)
  walk_i(ASSESSMENT_LEPRA0_1_INT,assess,lepra1)
  walk_b(ASSESSMENT_LEPRA0_1_BOOL,assess,lepra1)
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


