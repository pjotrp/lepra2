class CreateReactions < ActiveRecord::Migration
  def change
    create_table :reactions do |t|
      t.belongs_to :person
      t.date   :date   # recorded reaction date

      t.timestamps
    end
  end
end
