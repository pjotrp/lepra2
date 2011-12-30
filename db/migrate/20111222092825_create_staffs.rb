class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string :name
      t.string     :registration # optional 
      t.belongs_to :clinic
      t.timestamps
    end
    add_index :staffs, :name
  end
end
