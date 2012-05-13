class ChangeContacts < ActiveRecord::Migration
  def change
    change_table :contacts do |t|
      t.integer    :address_id
    end
  end
end
