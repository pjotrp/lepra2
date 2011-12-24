
=begin

Location describes a village

      t.string :village
      t.string :district
      t.string :union
      t.string :upozilla
      t.string :latitude
      t.string :longitude

=end

class Location < ActiveRecord::Base
  belongs_to :address
  belongs_to :clinic
end
