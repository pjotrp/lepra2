class CreatePersonalHistories < ActiveRecord::Migration
  def change
    create_table :personal_histories do |t|
      # This table contains non-medical personal details - for medical
      # use the Contact table
      t.belongs_to :person
      t.date    :registration_date
      t.integer :staff
      t.integer :finder
      t.string  :occupation # BE(ggar) D(ay labor) BU(ssiness) S (official) T(eacher) O(ther)
      t.string  :education # class 1 to5= 1, Class 6 to ten=2, Class 11 to 14=3, >= class 15=4
      t.integer :symbol_guardian
      t.integer :current_address_id
      t.integer :members # number of household members
      t.integer :income  # household income
      t.text    :remark    
      # t.integer :remark

      t.timestamps
    end
    add_index :personal_histories, :person_id
  end
end
