class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.boolean :reaction 

      t.timestamps
    end
  end
end
