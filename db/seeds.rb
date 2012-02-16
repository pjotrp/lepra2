# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "socket"
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
