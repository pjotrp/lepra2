
=begin
The Address book contains records referring to a location.

A person can have 1 or more addresses, and a current address, 
all part of the personal history.

A clinic also has an address and location.

      has_one :location

      t.belongs_to :personal_history
      t.belongs_to :clinic

      t.string  :road,     :null => false
      t.string  :village,  :null => false
      t.string  :postcode
      t.string  :phone
      t.string  :latitude                   # override location
      t.string  :longitude                  # override location
      t.text    :remark    

=end

class Address < ActiveRecord::Base
  belongs_to :personal_history
  has_one :location
end
