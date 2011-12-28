=begin

Reaction table

=end

class Reaction < ActiveRecord::Base
  belongs_to :person 
  belongs_to :contact
end
