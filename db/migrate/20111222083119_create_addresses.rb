class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :road
      t.string :village
      t.string :postcode
      t.integer :location
      t.integer :district
      t.integer :remark

      t.timestamps
    end
  end
end
