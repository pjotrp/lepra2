# Read the legacy database tables into the new schema
#
# Copyright (C) 2011 Pjotr Prins <pjotr.prins@thebird.nl>

require 'active_record'
require 'mysql2'

ROOT = File.join(File.dirname(__FILE__), '..', '..')
['/lib', '/db'].each do |folder|
  $:.unshift File.join(ROOT, folder)
end

ActiveRecord::Base.configurations = YAML::load(IO.read('../../config/database.yml'))
ActiveRecord::Base.establish_connection('development')
 
require 'schema'
