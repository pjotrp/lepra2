class CreatePersonalHistories < ActiveRecord::Migration
  def change
    create_table :personal_histories do |t|
      # This table contains non-medical personal details - for medical
      # use the Contact table
      t.belongs_to :person
      t.string  :registration, :null => false # read-only
      t.date    :registration_date, :null => false # copy of first person registration date
      t.date    :date, :null => false # maybe superfluous, but can differ from other dates
      t.integer :staff_id, :null => false
      t.integer :finder_lca
      t.string  :symbol_occupation # BE(ggar) D(ay labor) BU(ssiness) S (official) T(eacher) O(ther)
      t.string  :symbol_education # class 1 to5= 1, Class 6 to ten=2, Class 11 to 14=3, >= class 15=4
      t.string  :symbol_guardian
      t.string  :guardian_name
      t.integer :members # number of household members
      t.integer :income  # household income
      t.boolean :latrine_access 
      t.boolean :rft # released from treatment
      t.boolean :died

      t.text    :remark    
      # t.integer :remark

      t.timestamps
    end
    add_index :personal_histories, :person_id
  end
end
