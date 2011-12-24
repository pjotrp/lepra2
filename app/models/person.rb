class Person < ActiveRecord::Base
  # validates :year_of_birth, :length => { :in => 1950..Time.now.year }
  YEAR = Time.now.year
  YEAR1 = YEAR - 90
  validates_inclusion_of :year_of_birth, :in => YEAR1..YEAR, :message => "can only be between #{YEAR1} and #{YEAR}."
end
