class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.belongs_to :location
      t.belongs_to :person
      # the flollowing sets
      # t.integer :addressable_id
      # t.string  :addressable_type
      # t.references :addressable, :polymorphic => true
      t.string  :road,     :null => false
      t.string  :village,  :null => false
      t.string  :postcode
      t.string  :phone
      t.integer :clinic_id   # keep clinic ID here for imports
      # location contains district etc.
      t.string  :latitude                   # override location
      t.string  :longitude                  # override location
      t.text    :remark    

      t.timestamps
    end
    add_index :addresses, [ :person_id ]
  end
end
