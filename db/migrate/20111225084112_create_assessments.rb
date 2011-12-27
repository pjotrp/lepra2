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

      # ulcers
      t.integer :ulcers  
      t.boolean :ulcers_palm_simple_r
      t.boolean :ulcers_palm_simple_l
      t.boolean :ulcers_sole_simple_r
      t.boolean :ulcers_sole_simple_l
      t.boolean :ulcers_palm_complicated_r
      t.boolean :ulcers_palm_complicated_l
      t.boolean :ulcers_sole_complicated_r
      t.boolean :ulcers_sole_complicated_l
      t.boolean :ulcers_palm_malignant_r
      t.boolean :ulcers_palm_malignant_l
      t.boolean :ulcers_sole_malignant_r
      t.boolean :ulcers_sole_malignant_l
      t.boolean :ulcers_palm_infected_r
      t.boolean :ulcers_palm_infected_l
      t.boolean :ulcers_sole_infected_r
      t.boolean :ulcers_sole_infected_l

      # sensory
      t.integer :sensory_score_hand_r
      t.integer :sensory_score_hand_l
      t.integer :sensory_score_foot_r
      t.integer :sensory_score_foot_l
      t.integer :sensory_score_eye_r
      t.integer :sensory_score_eye_l

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

      # quick muscle testing
      t.integer :qmt_eye_closure_strength_r   # QMT Light eye closure (strength) Right
      t.integer :qmt_eye_closure_strength_l   # QMT Light eye closure (strength) Left
      t.integer :qmt_eye_closure_gap_r        # QMT Light eye closure (gap) Right
      t.integer :qmt_eye_closure_gap_l        # QMT Light eye closure (gap) Left
      t.integer :qmt_little_finger_r          # QMT Little finger abd(ADM) Right
      t.integer :qmt_little_finger_l          # QMT Little finger abd(ADM) Left
      t.integer :qmt_thumb_r                  # QMT Thumb abd(APB) Right
      t.integer :qmt_thumb_l                  # QMT Thumb abd(APB) Left
      t.integer :qmt_wrist_r                  # QMT Wrist extension Right
      t.integer :qmt_wrist_l                  # QMT Wrist extension Left
      t.integer :qmt_dorsiflexion_foot_r      # QMT Dorsiflexion Right foot
      t.integer :qmt_dorsiflexion_foot_l      # QMT Dorsiflexion Left foot

      t.boolean :shr01
      t.boolean :shr01
      t.boolean :shr02
      t.boolean :shr03
      t.boolean :shr04
      t.boolean :shr05
      t.boolean :shr06
      t.boolean :shr07
      t.boolean :shr08
      t.boolean :shr09
      t.boolean :shr10
      t.boolean :shr11
      t.boolean :shr12
      t.boolean :shl01
      t.boolean :shl01
      t.boolean :shl02
      t.boolean :shl03
      t.boolean :shl04
      t.boolean :shl05
      t.boolean :shl06
      t.boolean :shl07
      t.boolean :shl08
      t.boolean :shl09
      t.boolean :shl10
      t.boolean :shl11
      t.boolean :shl12

      t.boolean :sfr01
      t.boolean :sfr01
      t.boolean :sfr02
      t.boolean :sfr03
      t.boolean :sfr04
      t.boolean :sfr05
      t.boolean :sfr06
      t.boolean :sfr07
      t.boolean :sfr08
      t.boolean :sfr09
      t.boolean :sfr10
      t.boolean :sfr11

      t.boolean :sfl01
      t.boolean :sfl01
      t.boolean :sfl02
      t.boolean :sfl03
      t.boolean :sfl04
      t.boolean :sfl05
      t.boolean :sfl06
      t.boolean :sfl07
      t.boolean :sfl08
      t.boolean :sfl09
      t.boolean :sfl10
      t.boolean :sfl11

      t.text :remark

      t.timestamps
    end
    add_index :assessments, :person_id
  end
end
