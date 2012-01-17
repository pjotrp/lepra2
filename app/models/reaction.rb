=begin

Reaction table

=end

class Reaction < ActiveRecord::Base
  belongs_to :person 
  belongs_to :contact
  def fields
    a = attributes.keys.to_a
    a.delete_if { | e | e =~ /id$/ }
  end
end
