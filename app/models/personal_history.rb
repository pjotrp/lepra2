=begin

This table contains non-medical personal details - for medical
details use the Contact and Assessment tables

=end

class PersonalHistory < ActiveRecord::Base
  belongs_to :person
  has_one :address, :as => :addressable
end
