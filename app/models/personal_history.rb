=begin

This table contains non-medical personal details - for medical
details use the Contact and Assessment tables

      t.belongs_to :person
      t.date    :registration_date
      t.integer :staff
      t.string  :occupation # BE(ggar) D(ay labor) BU(ssiness) S (official) T(eacher) O(ther)
      t.string  :education # class 1 to5= 1, Class 6 to ten=2, Class 11 to 14=3, >= class 15=4
      t.string  :guardian
      t.integer :current_address_id
      t.integer :members # number of household members
      t.integer :income  # household income
      t.text    :remark    
      # t.integer :remark

      t.timestamps

=end

class PersonalHistory < ActiveRecord::Base
  belongs_to :person
  has_one :address, :as => :addressable
end
