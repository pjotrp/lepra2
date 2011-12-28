# Staff information

class Staff < ActiveRecord::Base
  has_one :address, :as => :addressable
  belongs_to :clinic
end
