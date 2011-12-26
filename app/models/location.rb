
=begin

Location describes a location on the map - ideally closest village,
and GPS coordinates are added

      t.belongs_to :address
      t.belongs_to :clinic
      t.string :village
      t.string :district
      t.string :union
      t.string :upozilla
      t.string :latitude
      t.string :longitude
      t.text    :remark    

=end

class Location < ActiveRecord::Base
  belongs_to :address
  belongs_to :clinic
end
