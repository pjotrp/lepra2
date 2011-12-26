class CreateReactions < ActiveRecord::Migration
  def change
    create_table :reactions do |t|
      t.belongs_to :person
      t.belongs_to :contact  # holds staff info
      t.date   :date   # recorded reaction date

      t.integer :duration_months
      t.boolean :type1
      t.boolean :type_neuritis
      t.boolean :type2
      t.integer :type1_grade
      t.integer :type2_grade

      t.integer :nerve_pain_score_facila_r
      t.integer :nerve_pain_score_facila_l
      t.integer :nerve_pain_score_radial_r
      t.integer :nerve_pain_score_radial_l
      t.integer :nerve_pain_score_ulnar_r
      t.integer :nerve_pain_score_ulnar_l
      t.integer :nerve_pain_score_median_r
      t.integer :nerve_pain_score_median_l
      t.integer :nerve_pain_score_common_r
      t.integer :nerve_pain_score_common_l
      t.integer :nerve_pain_score_posterior_r
      t.integer :nerve_pain_score_posterior_l

      t.text   :remark
      t.timestamps
    end
    add_index :reactions, :person_id
  end
end
