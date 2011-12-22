class CreatePersonalHistories < ActiveRecord::Migration
  def change
    create_table :personal_histories do |t|
      t.string :occupation
      t.string :education
      t.integer :guardian
      t.integer :address
      t.integer :members # house members
      t.integer :income  # household income
      t.integer :remark

      t.timestamps
    end
  end
end
