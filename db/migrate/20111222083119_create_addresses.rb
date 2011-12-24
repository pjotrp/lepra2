class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string  :road,     :null => false
      t.string  :village,  :null => false
      t.string  :postcode
      t.string  :phone
      t.integer :location, :null => false   # village/distict/coordinates
      t.string  :latitude                   # override location
      t.string  :longitude                  # override location
      t.text    :remark    

      t.timestamps
    end
  end
end
