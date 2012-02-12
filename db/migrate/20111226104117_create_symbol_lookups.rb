class CreateSymbolLookups < ActiveRecord::Migration
  def change
    create_table :symbol_lookups do |t|
      t.string  :name
      t.string  :value
      t.string  :description
      t.integer :rank # doubles as valuenum
      t.integer :codeid # possible ID for exports

      t.timestamps
    end
    add_index :symbol_lookups, :name
  end
end
