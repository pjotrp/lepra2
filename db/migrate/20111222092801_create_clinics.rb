class CreateClinics < ActiveRecord::Migration
  def change
    create_table :clinics do |t|
      t.references :addressable, :polymorphic => true
      t.text    :remark    

      t.timestamps
    end
    add_index :clinics, :id
  end
end
