=begin

Person contains unique information that does not mutate. See PersonalHistory and Contact for mutating records.

      t.string  :registration, :null => false, :unique => true  # clinic/num/YYYY
      t.string  :name, :null => false
      t.integer :year_of_birth, :null => false
      t.boolean :male   # male (true) or female (false)  
      t.string  :fathers_name
      t.text    :remark    

      t.timestamps

=end

class Person < ActiveRecord::Base
  has_many :personal_histories  # address is part of personal history
  has_many :addresses, :through => :personal_histories
  has_many :contacts
  has_many :assessments, :through => :contacts
  has_many :reactions, :through => :contacts

  # validates :year_of_birth, :length => { :in => 1950..Time.now.year }
  validates_numericality_of :year_of_birth, :only_integer => true, :message => "can only be whole number."
  YEAR = Time.now.year
  YEAR1 = YEAR - 90
  validates_inclusion_of :year_of_birth, :in => YEAR1..YEAR, :message => "can only be between #{YEAR1} and #{YEAR}."
end
