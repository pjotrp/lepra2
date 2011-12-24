class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string  :road
      t.string  :village
      t.string  :postcode
      t.string  :phone
      t.integer :location   # village/distict/gps
      t.string  :latitude   # override location
      t.string  :longitude  # override location
      t.text    :remark    

      t.timestamps
    end
  end
end
