class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string  :registration, :null => false, :unique => true  # clinic/num/YYYY
      t.string  :name, :null => false
      t.integer :year_of_birth, :null => false
      t.boolean :male, :default => false, :null => false   # male (true) or female (false)  
      t.string  :fathers_name
      t.string  :reg_study
      t.text    :remark    

      t.timestamps
    end
    add_index :people, :registration
    add_index :people, :name
  end
end
