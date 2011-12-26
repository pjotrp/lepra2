class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.belongs_to :personal_history
      t.belongs_to :clinic
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
    add_index :addresses, [ :personal_history_id ]
  end
end
