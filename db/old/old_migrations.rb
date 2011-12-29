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

class Lepra0Lepra1 < Lepra0Base
  set_table_name "lepra1"
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

PERSONALHISTORY_LEPRA0_1 = {
  'FINDER_LCA' => :finder_lca,
  'OCCUP' => :symbol_occupation,
  # 'EDUCAT' => :symbol_education,
  # '?' => :symbol_guardian,
}
CONTACT_LEPRA0_1 = {
  'CLINIC_NUM' => :clinic_id,
  'HW_NUM'     => :staff_id,
  'TYPE'       => :symbol_patient_type,
  'OUT'        => :symbol_patient_status,
  'GROUP'      => :symbol_treatment,
  'MDTDATE'    => :mdt_date,
  'SMEARFDATE'    => :smearf_date,
  'SMEARLDATE'    => :smear_date,
  'RFT_DATE'    => :rft_date,
  # 'PRE_DATE'    => :rft_date, in LEPRA3
}
CONTACT_LEPRA0_1_INT = {
  'DOSES'   => :mdt_dose,
  'SMEARF'   => :symbol_smearf,
  'SMEARL'   => :symbol_smear,
}
CONTACT_LEPRA0_1_BOOL = {
  'PRE_DOSE'   => :prednisolon,
  'FINAL_ASS'  => :final_assessment,
}

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
Lepra0Lepra1.find(:all, :limit=>LIMIT).each do | rec |
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
    p rec.VILLAGE
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
    PERSONALHISTORY_LEPRA0_1.each do | k, v |
      hist.send(v.to_s+'=',rec.send(k.to_sym))
    end
    print "Updating ",person.id," ",person.name," to PersonalHistory\n"
    hist.save
    address2 = Address.find(address.id)
    address2.personal_history_id = hist.id
    address2.save
    contact = Contact.find_or_initialize_by_id(person.id)
    contact.id = person.id
    contact.updated_at = rec.CONTACTLST
    contact.date = rec.CONTACTLST
    contact.person_id = person.id
    contact.symbol_medication = rec.STATUS.to_i.to_s if rec.STATUS
    CONTACT_LEPRA0_1.each do | k, v |
      contact.send(v.to_s+'=',rec.send(k.to_sym))
    end
    CONTACT_LEPRA0_1_INT.each do | k, v |
      contact.send(v.to_s+'=',rec.send(k.to_sym).to_i)
    end
    CONTACT_LEPRA0_1_BOOL.each do | k, v |
      value = rec[k] == "\x01"
      contact.send(v.to_s+'=',value)
    end
    contact.save
    print "Updating ",person.id," ",person.name," to People\n"
    person.save
  # end  
end


