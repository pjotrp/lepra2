class CreateSymbolLookups < ActiveRecord::Migration
  def change
    create_table :symbol_lookups do |t|
      t.sting :name
      t.string :value
      t.string :description

      t.timestamps
    end
  end
end
