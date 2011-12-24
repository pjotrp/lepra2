
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
  belongs_to :personal_history
  has_one :location
end
