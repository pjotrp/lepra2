# RailsAdmin config file. Generated on December 28, 2011 10:25
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|

  # If your default_local is different from :en, uncomment the following 2 lines and set your default locale here:
  # require 'i18n'
  # I18n.default_locale = :de

  config.current_user_method { current_user } # auto-generated

  # Set the admin name here (optional second array element will appear in a beautiful RailsAdmin red ©)
  config.main_app_name = ['Lepra2', 'Admin']
  # or for a dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }


  #  ==> Global show view settings
  # Display empty fields in show views
  # config.compact_show_view = false

  #  ==> Global list view settings
  # Number of default rows per-page:
  # config.default_items_per_page = 20

  #  ==> Included models
  # Add all excluded models here:
  # config.excluded_models = [Address, Assessment, Clinic, Contact, Location, Person, PersonalHistory, Reaction, Remark, Staff, SymbolLookup]

  # Add models here if you want to go 'whitelist mode':
  # config.included_models = [Address, Assessment, Clinic, Contact, Location, Person, PersonalHistory, Reaction, Remark, Staff, SymbolLookup]

  # Application wide tried label methods for models' instances
  # config.label_methods << :description # Default is [:name, :title]

  #  ==> Global models configuration
  # config.models do
  #   # Configuration here will affect all included models in all scopes, handle with care!
  #
  #   list do
  #     # Configuration here will affect all included models in list sections (same for show, export, edit, update, create)
  #
  #     fields_of_type :date do
  #       # Configuration here will affect all date fields, in the list section, for all included models. See README for a comprehensive type list.
  #     end
  #   end
  # end
  #
  #  ==> Model specific configuration
  # Keep in mind that *all* configuration blocks are optional.
  # RailsAdmin will try his best to provide the best defaults for each section, for each field.
  # Try to override as few things as possible, in the most generic way. Try to avoid setting labels for models and attributes, use ActiveRecord I18n API instead.
  # Less code is better code!
  # config.model MyModel do
  #   # Cross-section field configuration
  #   object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #   label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #   label_plural 'My models'      # Same, plural
  #   weight -1                     # Navigation priority. Bigger is higher.
  #   parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #   navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  #   # Section specific configuration:
  #   list do
  #     filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #     items_per_page 100    # Override default_items_per_page
  #     sort_by :id           # Sort column (default is primary key)
  #     sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     # Here goes the fields configuration for the list view
  #   end
  # end

  # Your model's configuration, to help you get started:

  # All fields marked as 'hidden' won't be shown anywhere in the rails_admin unless you mark them as visible. (visible(true))

  # config.model Address do
  #   # Found associations:
  #     configure :personal_history, :belongs_to_association 
  #     configure :location, :has_one_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :personal_history_id, :integer         # Hidden 
  #     configure :clinic_id, :integer 
  #     configure :road, :string 
  #     configure :village, :string 
  #     configure :postcode, :string 
  #     configure :phone, :string 
  #     configure :latitude, :string 
  #     configure :longitude, :string 
  #     configure :remark, :text 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Assessment do
  #   # Found associations:
  #     configure :person, :belongs_to_association 
  #     configure :contact, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :person_id, :integer         # Hidden 
  #     configure :contact_id, :integer         # Hidden 
  #     configure :lesions, :integer 
  #     configure :lesions_inflam, :boolean 
  #     configure :lesions_face, :boolean 
  #     configure :lesions_arm_r, :boolean 
  #     configure :lesions_arm_l, :boolean 
  #     configure :lesions_trunk, :boolean 
  #     configure :lesions_leg_r, :boolean 
  #     configure :lesions_leg_l, :boolean 
  #     configure :oed_hands, :boolean 
  #     configure :oed_feed, :boolean 
  #     configure :ulcers, :integer 
  #     configure :ulcers_palm_simple_r, :boolean 
  #     configure :ulcers_palm_simple_l, :boolean 
  #     configure :ulcers_sole_simple_r, :boolean 
  #     configure :ulcers_sole_simple_l, :boolean 
  #     configure :ulcers_palm_complicated_r, :boolean 
  #     configure :ulcers_palm_complicated_l, :boolean 
  #     configure :ulcers_sole_complicated_r, :boolean 
  #     configure :ulcers_sole_complicated_l, :boolean 
  #     configure :ulcers_palm_malignant_r, :boolean 
  #     configure :ulcers_palm_malignant_l, :boolean 
  #     configure :ulcers_sole_malignant_r, :boolean 
  #     configure :ulcers_sole_malignant_l, :boolean 
  #     configure :ulcers_palm_infected_r, :boolean 
  #     configure :ulcers_palm_infected_l, :boolean 
  #     configure :ulcers_sole_infected_r, :boolean 
  #     configure :ulcers_sole_infected_l, :boolean 
  #     configure :sensory_score_hand_r, :integer 
  #     configure :sensory_score_hand_l, :integer 
  #     configure :sensory_score_foot_r, :integer 
  #     configure :sensory_score_foot_l, :integer 
  #     configure :sensory_score_eye_r, :integer 
  #     configure :sensory_score_eye_l, :integer 
  #     configure :deformity_hag_r, :boolean 
  #     configure :deformity_hag_l, :boolean 
  #     configure :deformity_facial_r, :boolean 
  #     configure :deformity_facial_l, :boolean 
  #     configure :deformity_claw_hand_r, :boolean 
  #     configure :deformity_claw_hand_l, :boolean 
  #     configure :deformity_ape_thumb_r, :boolean 
  #     configure :deformity_ape_thumb_l, :boolean 
  #     configure :deformity_wrist_drop_r, :boolean 
  #     configure :deformity_wrist_drop_l, :boolean 
  #     configure :deformity_foot_drop_r, :boolean 
  #     configure :deformity_foot_drop_l, :boolean 
  #     configure :deformity_claw_toes_r, :boolean 
  #     configure :deformity_claw_toes_l, :boolean 
  #     configure :deformity_absent_finger_r, :boolean 
  #     configure :deformity_absent_finger_l, :boolean 
  #     configure :deformity_absent_toes_r, :boolean 
  #     configure :deformity_absent_toes_l, :boolean 
  #     configure :deformity_palmar_r, :boolean 
  #     configure :deformity_palmar_l, :boolean 
  #     configure :deformity_planter_r, :boolean 
  #     configure :deformity_planter_l, :boolean 
  #     configure :num_nerve_damage_prev, :integer 
  #     configure :nerve_facial_enlarged_r, :boolean 
  #     configure :nerve_facial_enlarged_l, :boolean 
  #     configure :nerve_facial_tender_r, :boolean 
  #     configure :nerve_facial_tender_l, :boolean 
  #     configure :nerve_radial_enlarged_r, :boolean 
  #     configure :nerve_radial_enlarged_l, :boolean 
  #     configure :nerve_radial_tender_r, :boolean 
  #     configure :nerve_radial_tender_l, :boolean 
  #     configure :nerve_ulcer_enlarged_r, :boolean 
  #     configure :nerve_ulcer_enlarged_l, :boolean 
  #     configure :nerve_ulcer_tender_r, :boolean 
  #     configure :nerve_ulcer_tender_l, :boolean 
  #     configure :nerve_median_enlarged_r, :boolean 
  #     configure :nerve_median_enlarged_l, :boolean 
  #     configure :nerve_median_tender_r, :boolean 
  #     configure :nerve_median_tender_l, :boolean 
  #     configure :nerve_common_enlarged_r, :boolean 
  #     configure :nerve_common_enlarged_l, :boolean 
  #     configure :nerve_common_tender_r, :boolean 
  #     configure :nerve_common_tender_l, :boolean 
  #     configure :nerve_posterior_enlarged_r, :boolean 
  #     configure :nerve_posterior_enlarged_l, :boolean 
  #     configure :nerve_posterior_tender_r, :boolean 
  #     configure :nerve_posterior_tender_l, :boolean 
  #     configure :qmt_eye_closure_strength_r, :integer 
  #     configure :qmt_eye_closure_strength_l, :integer 
  #     configure :qmt_eye_closure_gap_r, :integer 
  #     configure :qmt_eye_closure_gap_l, :integer 
  #     configure :qmt_little_finger_r, :integer 
  #     configure :qmt_little_finger_l, :integer 
  #     configure :qmt_thumb_r, :integer 
  #     configure :qmt_thumb_l, :integer 
  #     configure :qmt_wrist_r, :integer 
  #     configure :qmt_wrist_l, :integer 
  #     configure :qmt_dorsiflexion_foot_r, :integer 
  #     configure :qmt_dorsiflexion_foot_l, :integer 
  #     configure :shr01, :boolean 
  #     configure :shr02, :boolean 
  #     configure :shr03, :boolean 
  #     configure :shr04, :boolean 
  #     configure :shr05, :boolean 
  #     configure :shr06, :boolean 
  #     configure :shr07, :boolean 
  #     configure :shr08, :boolean 
  #     configure :shr09, :boolean 
  #     configure :shr10, :boolean 
  #     configure :shr11, :boolean 
  #     configure :shr12, :boolean 
  #     configure :shl01, :boolean 
  #     configure :shl02, :boolean 
  #     configure :shl03, :boolean 
  #     configure :shl04, :boolean 
  #     configure :shl05, :boolean 
  #     configure :shl06, :boolean 
  #     configure :shl07, :boolean 
  #     configure :shl08, :boolean 
  #     configure :shl09, :boolean 
  #     configure :shl10, :boolean 
  #     configure :shl11, :boolean 
  #     configure :shl12, :boolean 
  #     configure :sfr01, :boolean 
  #     configure :sfr02, :boolean 
  #     configure :sfr03, :boolean 
  #     configure :sfr04, :boolean 
  #     configure :sfr05, :boolean 
  #     configure :sfr06, :boolean 
  #     configure :sfr07, :boolean 
  #     configure :sfr08, :boolean 
  #     configure :sfr09, :boolean 
  #     configure :sfr10, :boolean 
  #     configure :sfr11, :boolean 
  #     configure :sfl01, :boolean 
  #     configure :sfl02, :boolean 
  #     configure :sfl03, :boolean 
  #     configure :sfl04, :boolean 
  #     configure :sfl05, :boolean 
  #     configure :sfl06, :boolean 
  #     configure :sfl07, :boolean 
  #     configure :sfl08, :boolean 
  #     configure :sfl09, :boolean 
  #     configure :sfl10, :boolean 
  #     configure :sfl11, :boolean 
  #     configure :remark, :text 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Clinic do
  #   # Found associations:
  #     configure :contact, :belongs_to_association 
  #     configure :location, :has_one_association 
  #     configure :staff, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :remark, :text 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Contact do
  #   # Found associations:
  #     configure :person, :belongs_to_association 
  #     configure :clinic, :belongs_to_association 
  #     configure :staff, :belongs_to_association 
  #     configure :assessment, :has_one_association 
  #     configure :reaction, :has_one_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :person_id, :integer         # Hidden 
  #     configure :clinic_id, :integer         # Hidden 
  #     configure :staff_id, :integer         # Hidden 
  #     configure :date, :date 
  #     configure :symbol_patient_type, :integer 
  #     configure :symbol_patient_status, :integer 
  #     configure :final_assessment, :boolean 
  #     configure :symbol_medication, :integer 
  #     configure :symbol_treatment, :integer 
  #     configure :mdt_dose, :integer 
  #     configure :mdt_date, :date 
  #     configure :symbol_smearf, :integer 
  #     configure :smearf_date, :date 
  #     configure :symbol_smear, :integer 
  #     configure :smear_date, :date 
  #     configure :rft_date, :date 
  #     configure :prednisolon, :boolean 
  #     configure :diy, :boolean 
  #     configure :diy_specify, :string 
  #     configure :hospital_admission, :boolean 
  #     configure :hospital_neuritis, :boolean 
  #     configure :hospital_plantar_alcer, :boolean 
  #     configure :hospital_eye_complication, :boolean 
  #     configure :hospital_other, :boolean 
  #     configure :hospital_specify, :string 
  #     configure :contact_planned, :date 
  #     configure :symbol_detection, :integer 
  #     configure :symbol_referred, :integer 
  #     configure :health_worker, :integer 
  #     configure :finder_lca, :integer 
  #     configure :symbol_disability, :integer 
  #     configure :symbol_chronic_disability, :integer 
  #     configure :duration_years, :integer 
  #     configure :duration_months, :integer 
  #     configure :young_years, :integer 
  #     configure :young_months, :integer 
  #     configure :bcg_scar, :boolean 
  #     configure :trauma_operation, :boolean 
  #     configure :disease, :boolean 
  #     configure :disease_descr, :string 
  #     configure :lesions, :integer 
  #     configure :pregnant, :boolean 
  #     configure :pregnancy_date, :date 
  #     configure :breast_feeding, :boolean 
  #     configure :surgical_rehab, :boolean 
  #     configure :social_rehab, :boolean 
  #     configure :remark, :text 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Location do
  #   # Found associations:
  #     configure :address, :belongs_to_association 
  #     configure :clinic, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :address_id, :integer         # Hidden 
  #     configure :clinic_id, :integer         # Hidden 
  #     configure :village, :string 
  #     configure :district, :string 
  #     configure :union, :string 
  #     configure :upozilla, :string 
  #     configure :latitude, :string 
  #     configure :longitude, :string 
  #     configure :remark, :text 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Person do
  #   # Found associations:
  #     configure :addresses, :has_many_association 
  #     configure :personal_histories, :has_many_association 
  #     configure :contacts, :has_many_association 
  #     configure :assessments, :has_many_association 
  #     configure :reactions, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :registration, :string 
  #     configure :name, :string 
  #     configure :year_of_birth, :integer 
  #     configure :male, :boolean 
  #     configure :fathers_name, :string 
  #     configure :reg_study, :string 
  #     configure :remark, :text 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model PersonalHistory do
  #   # Found associations:
  #     configure :person, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :person_id, :integer         # Hidden 
  #     configure :registration_date, :date 
  #     configure :staff, :integer 
  #     configure :finder, :integer 
  #     configure :occupation, :string 
  #     configure :education, :string 
  #     configure :guardian, :string 
  #     configure :current_address_id, :integer 
  #     configure :members, :integer 
  #     configure :income, :integer 
  #     configure :remark, :text 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Reaction do
  #   # Found associations:
  #     configure :person, :belongs_to_association 
  #     configure :contact, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :person_id, :integer         # Hidden 
  #     configure :contact_id, :integer         # Hidden 
  #     configure :date, :date 
  #     configure :duration_months, :integer 
  #     configure :type1, :boolean 
  #     configure :type_neuritis, :boolean 
  #     configure :type2, :boolean 
  #     configure :type1_grade, :integer 
  #     configure :type2_grade, :integer 
  #     configure :nerve_pain_score_facila_r, :integer 
  #     configure :nerve_pain_score_facila_l, :integer 
  #     configure :nerve_pain_score_radial_r, :integer 
  #     configure :nerve_pain_score_radial_l, :integer 
  #     configure :nerve_pain_score_ulnar_r, :integer 
  #     configure :nerve_pain_score_ulnar_l, :integer 
  #     configure :nerve_pain_score_median_r, :integer 
  #     configure :nerve_pain_score_median_l, :integer 
  #     configure :nerve_pain_score_common_r, :integer 
  #     configure :nerve_pain_score_common_l, :integer 
  #     configure :nerve_pain_score_posterior_r, :integer 
  #     configure :nerve_pain_score_posterior_l, :integer 
  #     configure :remark, :text 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Remark do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :reporter, :integer 
  #     configure :remark, :text 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Staff do
  #   # Found associations:
  #     configure :address, :has_one_association 
  #     configure :clinic, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :name, :string 
  #     configure :clinic_id, :integer         # Hidden 
  #     configure :address_id, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model SymbolLookup do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :name, :string 
  #     configure :value, :string 
  #     configure :description, :string 
  #     configure :rank, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
end
