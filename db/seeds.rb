# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "socket"
require "yaml"

if Socket.gethostname == 'bergamo'
  # only do this on a local development machine
  User.create(
    :email => 'pjotr.public37@thebird.nl', 
    :password => 'lepra2', 
    :password_confirmation => 'lepra2', 
    :first_name => 'Pjotr', 
    :last_name => 'Prins'
  )
end
if File.exist?('users.yml')
  users = YAML.load(File.read('users.yml'))
  users.each do | user | 
    p user
    User.create(
      :email => user[:email],
      :password => user[:password], 
      :password_confirmation => user[:password], 
      :first_name => user[:first_name], 
      :last_name => user[:last_name]
    )
  end
end
