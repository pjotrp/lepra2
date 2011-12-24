class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :village
      t.string :district
      t.string :union
      t.string :upozilla
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
