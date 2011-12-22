class CreateClinics < ActiveRecord::Migration
  def change
    create_table :clinics do |t|

      t.timestamps
    end
  end
end
