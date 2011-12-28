=begin

The Assessment table contains information on the state of the 
patient. Not every field has to be filled in, only when it is
'assessed'. Only the reaction data is found in the Reaction table.

A person can have 0 or more assessments. 

A contact (i.e. meeting with field worker) can have 1 assessment.

=end

class Assessment < ActiveRecord::Base
  belongs_to :person
  belongs_to :contact
end
