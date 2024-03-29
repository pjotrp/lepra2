class CreateAssessments < ActiveRecord::Migration
  def change
    create_table :assessments do |t|
      # The Assessment table contains information on the state of the 
      # patient.
      t.belongs_to :person
      t.belongs_to :contact   # refers to date, clinic, staff

      t.string  :registration # for reference
      t.date    :date
      # Smear
      t.integer    :symbol_smearf        # first time smear (0= smear negative,
      t.date       :smearf_date
      t.integer    :symbol_smear         # last time smear (0= smear negative,1
      t.date       :smear_date

      ### New fields
      t.boolean    :skin_redness
      t.boolean    :skin_raised
      t.boolean    :patch_border_clear
      t.boolean    :patch_itch
      t.boolean    :patch_skin_thick
      t.boolean    :nodule
      t.integer    :num_patches
      t.string     :symbol_patch_sensation   # present/partial/complete loss
      t.string     :symbol_patch_pain        # present/partial/complete loss

      ###
      t.boolean :relapse
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
      t.boolean :oed_feet

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
      t.boolean :deformity_lagophtalmos_r    
      t.boolean :deformity_lagophtalmos_l
      t.boolean :deformity_facialpalsy_r  
      t.boolean :deformity_facialpalsy_l  
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
      t.boolean :deformity_plantar_r # Plantar Anaesthetic
      t.boolean :deformity_plantar_l

      # Nerve damage
      t.integer :num_nerve_damage_prev
      t.integer :nerve_ulnar_enlarged_r
      t.integer :nerve_ulnar_enlarged_l
      t.integer :nerve_ulnar_tender_r
      t.integer :nerve_ulnar_tender_l
      t.boolean :nerve_ulnar_normal_r
      t.boolean :nerve_ulnar_normal_l

      t.boolean :nerve_facial_enlarged_r
      t.boolean :nerve_facial_enlarged_l
      t.boolean :nerve_facial_tender_r
      t.boolean :nerve_facial_tender_l
      t.boolean :nerve_facial_normal_r
      t.boolean :nerve_facial_normal_l
      t.boolean :nerve_radial_enlarged_r # Enlarged radial
      t.boolean :nerve_radial_enlarged_l
      t.boolean :nerve_radial_tender_r  # Tender/pain radia 
      t.boolean :nerve_radial_tender_l
      t.boolean :nerve_radial_normal_r  # Tender/pain radia 
      t.boolean :nerve_radial_normal_l
      t.boolean :nerve_median_enlarged_r
      t.boolean :nerve_median_enlarged_l
      t.boolean :nerve_median_tender_r
      t.boolean :nerve_median_tender_l
      t.boolean :nerve_median_normal_r
      t.boolean :nerve_median_normal_l

      t.boolean :nerve_radial_cuteneus_enlarger_r
      t.boolean :nerve_radial_cuteneus_enlarger_l
      t.boolean :nerve_radial_cuteneus_tender_r
      t.boolean :nerve_radial_cuteneus_tender_l
      t.boolean :nerve_radial_cuteneus_normal_r
      t.boolean :nerve_radial_cuteneus_normal_l

      t.boolean :nerve_common_peroneal_nerve_enlarged_r
      t.boolean :nerve_common_peroneal_nerve_enlarged_l
      t.boolean :nerve_common_peroneal_nerve_tender_r
      t.boolean :nerve_common_peroneal_nerve_tender_l
      t.boolean :nerve_common_peroneal_nerve_normal_r
      t.boolean :nerve_common_peroneal_nerve_normal_l

      t.boolean :nerve_posterior_tibial_nerve_enlarged_r
      t.boolean :nerve_posterior_tibial_nerve_enlarged_l
      t.boolean :nerve_posterior_tibial_nerve_tender_r
      t.boolean :nerve_posterior_tibial_nerve_tender_l
      t.boolean :nerve_posterior_tibial_nerve_normal_r
      t.boolean :nerve_posterior_tibial_nerve_normal_l

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

      t.boolean :sensitivity_hand_r01
      t.boolean :sensitivity_hand_r01
      t.boolean :sensitivity_hand_r02
      t.boolean :sensitivity_hand_r03
      t.boolean :sensitivity_hand_r04
      t.boolean :sensitivity_hand_r05
      t.boolean :sensitivity_hand_r06
      t.boolean :sensitivity_hand_r07
      t.boolean :sensitivity_hand_r08
      t.boolean :sensitivity_hand_r09
      t.boolean :sensitivity_hand_r10
      t.boolean :sensitivity_hand_r11
      t.boolean :sensitivity_hand_r12
      t.boolean :sensitivity_hand_l01
      t.boolean :sensitivity_hand_l01
      t.boolean :sensitivity_hand_l02
      t.boolean :sensitivity_hand_l03
      t.boolean :sensitivity_hand_l04
      t.boolean :sensitivity_hand_l05
      t.boolean :sensitivity_hand_l06
      t.boolean :sensitivity_hand_l07
      t.boolean :sensitivity_hand_l08
      t.boolean :sensitivity_hand_l09
      t.boolean :sensitivity_hand_l10
      t.boolean :sensitivity_hand_l11
      t.boolean :sensitivity_hand_l12

      t.boolean :sensitivity_foot_r01
      t.boolean :sensitivity_foot_r01
      t.boolean :sensitivity_foot_r02
      t.boolean :sensitivity_foot_r03
      t.boolean :sensitivity_foot_r04
      t.boolean :sensitivity_foot_r05
      t.boolean :sensitivity_foot_r06
      t.boolean :sensitivity_foot_r07
      t.boolean :sensitivity_foot_r08
      t.boolean :sensitivity_foot_r09
      t.boolean :sensitivity_foot_r10
      t.boolean :sensitivity_foot_r11

      t.boolean :sensitivity_foot_l01
      t.boolean :sensitivity_foot_l01
      t.boolean :sensitivity_foot_l02
      t.boolean :sensitivity_foot_l03
      t.boolean :sensitivity_foot_l04
      t.boolean :sensitivity_foot_l05
      t.boolean :sensitivity_foot_l06
      t.boolean :sensitivity_foot_l07
      t.boolean :sensitivity_foot_l08
      t.boolean :sensitivity_foot_l09
      t.boolean :sensitivity_foot_l10
      t.boolean :sensitivity_foot_l11

      t.text :remark

      t.timestamps
    end
    add_index :assessments, :person_id
  end
end
