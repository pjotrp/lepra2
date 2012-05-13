class ChangePersonalHistories < ActiveRecord::Migration
  def change
    change_table :personal_histories do |t|
      t.integer    :address_id
    end
  end
end
