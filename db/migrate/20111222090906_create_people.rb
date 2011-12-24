class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :registration, :null => false, :unique => true  # clinic/num/YYYY
      t.string :name, :null => false
      t.integer :year_of_birth, :null => false
      t.boolean :gender

      t.timestamps
    end
  end
end
