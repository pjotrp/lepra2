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

  validates :name, :registration, :presence => true
  validates :name, :length => { :minimum => 4 }
  validates_numericality_of :year_of_birth, :only_integer => true, :message => "can only be whole number."
  YEAR = Time.now.year
  YEAR1 = YEAR - 105
  validates_inclusion_of :year_of_birth, :in => YEAR1..YEAR, :message => "can only be between #{YEAR1} and #{YEAR}."

  def show_name
    ret = name
    ret = 'unknown' if ret == nil
    ret += ' ('+nickname+')' if nickname and nickname != ''
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
 
  def self.search(search, is_anywhere = true, clinic_id)
    clinic_id = false # ignore for now
    if not search and not clinic_id
      find(:all, :limit => 100)
    else
      query1 = 'registration=? OR name LIKE ? OR nickname=?'
      registration1 = search
      name1 = "#{search}%"
      nickname1 = search
      if is_anywhere
        query1 = 'registration=? or name LIKE ? OR nickname LIKE ?'
        name1 = "%#{search}%"
        nickname1 = "#{search}%"
      end
      if clinic_id
        query1 += ' AND personal_histories.clinic_id=?'
        find(:all, :include => :personal_histories, :conditions => [ query1, registration1, name1, nickname1, clinic_id], :limit => 100)
      else
        find(:all, :conditions => [ query1, registration1, name1, nickname1], :limit => 100)
      end
    end
  end


end
