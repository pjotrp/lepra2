
=begin
The Address book contains records referring to a location.

A person can have 1 or more addresses, and a current address, 
all part of the personal history.

A clinic also has an address and location.


=end
class Address < ActiveRecord::Base
  belongs_to :addressable, :polymorphic => true
  belongs_to :location
end
