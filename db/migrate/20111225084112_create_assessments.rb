class CreateAssessments < ActiveRecord::Migration
  def change
    create_table :assessments do |t|
      # The Assessment table contains information on the state of the 
      # patient.
      t.belongs_to :person
      t.belongs_to :contact   # refers to date, clinic, staff
      # lesions
      t.integer :lesions
      t.boolean :lesions_inflam
      t.boolean :lesions_face
      t.boolean :lesions_arm_r
      t.boolean :lesions_arm_l
      t.boolean :lesions_trunk
      t.boolean :lesions_leg_r
      t.boolean :lesions_leg_l
      t.boolean :oed_hands
      t.boolean :oed_feed

      # deformity
      t.boolean :deformity_hag_r     # Lagophtalmos
      t.boolean :deformity_hag_l
      t.boolean :deformity_facial_r  # Facialpalsy 
      t.boolean :deformity_facial_l  # Facialpalsy 
      t.boolean :deformity_claw_hand_r 
      t.boolean :deformity_claw_hand_l 
      t.boolean :deformity_ape_thumb_r
      t.boolean :deformity_ape_thumb_l
      t.boolean :deformity_wrist_drop_r
      t.boolean :deformity_wrist_drop_l
      t.boolean :deformity_foot_drop_r
      t.boolean :deformity_foot_drop_l
      t.boolean :deformity_claw_toes_r
      t.boolean :deformity_claw_toes_l
      t.boolean :deformity_absent_finger_r
      t.boolean :deformity_absent_finger_l
      t.boolean :deformity_absent_toes_r
      t.boolean :deformity_absent_toes_l
      t.boolean :deformity_palmar_r # Palmar Anaesthetic
      t.boolean :deformity_palmar_l
      t.boolean :deformity_planter_r # Planter Anaesthetic
      t.boolean :deformity_planter_l

      # Nerve damage
      t.integer :num_nerve_damage_prev
      t.boolean :nerve_facial_enlarged_r
      t.boolean :nerve_facial_enlarged_l
      t.boolean :nerve_facial_tender_r
      t.boolean :nerve_facial_tender_l
      t.boolean :nerve_radial_enlarged_r # Enlarged radial
      t.boolean :nerve_radial_enlarged_l
      t.boolean :nerve_radial_tender_r  # Tender/pain radia 
      t.boolean :nerve_radial_tender_l
      t.boolean :nerve_ulcer_enlarged_r
      t.boolean :nerve_ulcer_enlarged_l
      t.boolean :nerve_ulcer_tender_r
      t.boolean :nerve_ulcer_tender_l
      t.boolean :nerve_median_enlarged_r
      t.boolean :nerve_median_enlarged_l
      t.boolean :nerve_median_tender_r
      t.boolean :nerve_median_tender_l
      t.boolean :nerve_common_enlarged_r
      t.boolean :nerve_common_enlarged_l
      t.boolean :nerve_common_tender_r
      t.boolean :nerve_common_tender_l
      t.boolean :nerve_posterior_enlarged_r
      t.boolean :nerve_posterior_enlarged_l
      t.boolean :nerve_posterior_tender_r
      t.boolean :nerve_posterior_tender_l

      t.timestamps
    end
  end
end
