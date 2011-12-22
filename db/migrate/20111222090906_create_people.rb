class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :registration
      t.string :name
      t.integer :year_of_birth
      t.boolean :gender

      t.timestamps
    end
  end
end
