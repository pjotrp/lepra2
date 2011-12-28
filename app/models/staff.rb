# Staff information

class Staff < ActiveRecord::Base
  has_many :addresses, :as => :addressable
  belongs_to :clinic
end
