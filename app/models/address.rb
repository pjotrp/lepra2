
=begin
Address book:

      t.string  :road
      t.string  :village
      t.string  :postcode
      t.string  :phone
      t.integer :location   # village/distict/gps
      t.string  :latitude   # override location
      t.string  :longitude  # override location
      t.text    :remark    

=end

class Address < ActiveRecord::Base
  # has_one :location
end
