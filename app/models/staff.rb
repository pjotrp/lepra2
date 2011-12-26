# Staff information

class Staff < ActiveRecord::Base
  has_one :address
  belongs_to :clinic
end
