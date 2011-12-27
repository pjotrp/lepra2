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
  # set_table_name "people"
end

print People.count," records in Lepra2:People\n"


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

class Lepra0Lepra1 < Lepra0Base
  set_table_name "lepra1"

  def migrate_me!
    p self
  end
end
 
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
  end  
end


