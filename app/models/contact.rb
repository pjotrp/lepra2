class Contact < ActiveRecord::Base
  belongs_to :person
  belongs_to :clinic
  belongs_to :staff
  has_one    :assessment
  has_one    :reaction

  def fields
    a = attributes.keys.to_a
    a.delete_if { | e | e =~ /id$/ }
  end
end
