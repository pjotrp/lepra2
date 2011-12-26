class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string :name
      t.belongs_to :clinic
      t.belongs_to :address

      t.timestamps
    end
  end
end
