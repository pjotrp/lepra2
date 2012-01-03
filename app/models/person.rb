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
  has_many :assessments
  has_many :reactions

  # validates :year_of_birth, :length => { :in => 1950..Time.now.year }
  validates_numericality_of :year_of_birth, :only_integer => true, :message => "can only be whole number."
  YEAR = Time.now.year
  YEAR1 = YEAR - 105
  validates_inclusion_of :year_of_birth, :in => YEAR1..YEAR, :message => "can only be between #{YEAR1} and #{YEAR}."

  def show_name
    ret = name
    ret = 'unknown' if ret == nil
    ret += ' ('+nickname+')' if nickname
    ret
  end

  def clinic
    if contacts.size > 0
      return contacts.last.clinic_id
    end
    '?'
  end
 
  def village
    if addresses.size > 0
      return addresses.last.village
    end
    '-'
  end
 
  def self.search(search, is_anywhere = true)
    if search
      if not is_anywhere
        find(:all, :conditions => ['registration=? or name LIKE ? OR nickname=?', search, "#{search}%", search], :limit => 100)
      else
        find(:all, :conditions => ['registration=? or name LIKE ? OR nickname LIKE ?', search, "%#{search}%", "#{search}%"], :limit => 100)
      end
    else
      find(:all, :limit => 100)
    end
  end


end
