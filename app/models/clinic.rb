=begin

Clinic location and staff registration.

At time of contact, the field worker/clinic is tracked.

  belongs_to :contact
  has_one    :location
  has_many   :staff
=end

class Clinic < ActiveRecord::Base
  belongs_to :contact
  has_one    :location
  has_many   :staff
end
