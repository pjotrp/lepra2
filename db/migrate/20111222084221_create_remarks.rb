class CreateRemarks < ActiveRecord::Migration
  def change
    create_table :remarks do |t|
      t.integer :reporter
      t.text :remark

      t.timestamps
    end
  end
end
