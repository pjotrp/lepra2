class Person < ActiveRecord::Base
  has_many :addresses
  has_many :personal_histories
  has_many :contacts
  has_many :reactions

  # validates :year_of_birth, :length => { :in => 1950..Time.now.year }
  validates_numericality_of :year_of_birth, :only_integer => true, :message => "can only be whole number."
  YEAR = Time.now.year
  YEAR1 = YEAR - 90
  validates_inclusion_of :year_of_birth, :in => YEAR1..YEAR, :message => "can only be between #{YEAR1} and #{YEAR}."
end
