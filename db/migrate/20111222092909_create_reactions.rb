class CreateReactions < ActiveRecord::Migration
  def change
    create_table :reactions do |t|
      t.belongs_to :person
      t.belongs_to :contact  # holds staff info
      t.date   :date   # recorded reaction date
      t.text   :remark
      t.timestamps
    end
  end
end
