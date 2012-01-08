=begin

This table contains non-medical personal details - for medical
details use the Contact and Assessment tables

=end

class PersonalHistory < ActiveRecord::Base
  belongs_to :person
  has_many :addresses, :as => :addressable

  def fields
    a = attributes.keys.to_a
    a.delete_if { | e | e =~ /id$/ }
  end
end
