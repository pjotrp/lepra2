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

class Address < ActiveRecord::Base
end

class Location < ActiveRecord::Base
end

class SymbolLookup < ActiveRecord::Base 
end

print People.count," records in Lepra2:People\n"
print PersonalHistory.count," records in Lepra2:PersonalHistory\n"
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

class Lepra1Lookup < Lepra1Base
  set_table_name "tlookup"
end


# Symbols
SYMBOL = {
  ctype: 'Ctype',
  detection: 'Detect',
  disability: 'Disab',
}

Lepra1Lookup.find(:all).each do | rec |
#<Lepra1Lookup id: 239, LastUpdate: nil, CodeID: 161, Variable: "Status", Value: "6", Label: "RFC under care", ValueNum: 6>
  if not SymbolLookup.exists?(rec.id)
    lookup = SymbolLookup.new
    lookup.id = rec.id
    name = rec.Variable
    lookup.name = name
    lookup.name = SYMBOL[name].to_s if SYMBOL[name]
    lookup.value = rec.Value
    lookup.description = rec.Label
    lookup.rank = rec.ValueNum
    lookup.save
  end
end

# Patients
Lepra0Lepra1.find(:all, :limit=>LIMIT).each do | rec |
  if not People.exists?(rec.id)
    person = People.new
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
    print "Adding ",person.id," ",person.name," to People\n"
    person.save
    # address
    p rec.VILLAGE
    address_id = 
      if not Address.exists?(:village => rec.VILLAGE, :clinic_id => rec.CLINIC_NUM)
        address = Address.new
        address.village = rec.VILLAGE
        address.clinic_id = rec.CLINIC_NUM
        address.road = ''
        address.save
        address.id
      else
        address = Address.find_by_village_and_clinic_id(rec.VILLAGE,rec.CLINIC_NUM)
        address.id
      end  
    # location
    location_id = 
      if not Location.exists?(:village => rec.VILLAGE, :district => rec.DIST, 
                              :upozilla => rec.REG_UPO)
        loc = Location.new
        loc.clinic_id = rec.CLINIC_NUM
        loc.address_id = address_id
        loc.village = rec.VILLAGE
        loc.upozilla = rec.REG_UPO
        loc.clinic_id = rec.CLINIC_NUM
        loc.district = rec.DIST.to_i.to_s if rec.DIST
        # loc.union = rec.UNION
        loc.upozilla = rec.REG_UPO.to_i.to_s if rec.REG_UPO
        loc.save
        loc.id
      else
        loc = Location.find_by_village_and_district(rec.VILLAGE, rec.DIST)
        loc.id
      end  
    # personal history
    if not PersonalHistory.exists?(:person_id => person.id)
      hist = PersonalHistory.new
      hist.id = person.id
      hist.person_id = person.id
      hist.registration_date = rec.REG_DATE
      hist.staff = rec.HW_NUM  # staff who registered
      hist.finder = rec.FINDER_LCA if rec.FINDER_LCA and rec.FINDER_LCA > 0
      hist.occupation = rec.OCCUP
      hist.education = rec.EDUCAT.to_i.to_s if rec.EDUCAT
      # hist.guardian  FIXME
      hist.current_address_id = address_id
      hist.members = rec.HMEMBER
      hist.income = rec.HINCOME
      print "Adding ",person.id," ",person.name," to PersonalHistory\n"
      hist.save
      address2 = Address.find(address_id)
      address2.personal_history_id = hist.id
      address2.save
    end
  end  
end


