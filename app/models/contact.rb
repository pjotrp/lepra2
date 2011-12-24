class Contact < ActiveRecord::Base
  belongs_to :person
  has_one    :clinic
  has_one    :staff
end
