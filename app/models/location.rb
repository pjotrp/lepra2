
=begin

Location describes a location on the map - ideally closest village,
and GPS coordinates are added


=end

class Location < ActiveRecord::Base
  has_many :addresses, :as => :addressable
  belongs_to :clinic
end
