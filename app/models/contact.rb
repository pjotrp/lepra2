class Contact < ActiveRecord::Base
  belongs_to :person
  belongs_to :clinic
  belongs_to :staff
end
