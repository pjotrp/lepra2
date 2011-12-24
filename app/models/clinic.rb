class Clinic < ActiveRecord::Base
  belongs_to :contact
  has_one    :location
  has_many   :staff
end
