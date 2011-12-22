class CreatePersonalHistories < ActiveRecord::Migration
  def change
    create_table :personal_histories do |t|
      t.string :occupation
      t.integer :guardian
      t.integer :address
      t.integer :remark

      t.timestamps
    end
  end
end
