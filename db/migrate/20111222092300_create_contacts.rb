class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      # Contact table holds information relevant for each patient contact.
      # This table includes applied treatments. A few characteristics may
      # be listed and updated here, such as lesions.
      #
      # See also the Assessment and Reaction tables for patient state.
      t.belongs_to :person
      t.belongs_to :personal_history
      t.date       :date
      t.integer    :clinic_id
      t.integer    :staff_id
      t.integer    :symbol_patient_type    # Type of patient (BT,BB,BL.LL.TT, I)
      t.integer    :symbol_patient_status  # (B=BANDS pts, transfered, N=Out of Control,D=Died)
      t.boolean    :final_assessment
      t.integer    :symbol_medication      # (1= mono, 2=pb mdt, 3=MB mdt,4=RFT PB, 5= RFT MB, 6=RFC, 8=RFT mono)
                                  # MDT = multi drug therapy
                                  # RFT = release from treatment
                                  # RFC = release from control

      t.integer    :symbol_treatment     # M/MB= Multibacillary treatment, P/PB= Pacibacillary
      t.integer    :mdt_dose      # No.of doses (number of months of MDT)
      t.date       :mdt_date      # default to regdate
      t.integer    :symbol_smearf        # first time smear (0= smear negative,1,2,3,4,5,6 = smear positive, 9=no smear) This value does not change
      t.date       :smearf_date
      t.integer    :symbol_smear         # last time smear (0= smear negative,1,2,3,4,5,6 = smear positive, 9=no smear) 
      t.date       :smear_date
      t.date       :rft_date
    
      # medication
      t.boolean    :prednisolon   # low dose
      t.boolean    :diy
      t.string     :diy_specify
      t.boolean    :hospital_admission
      t.boolean    :hospital_neuritis
      t.boolean    :hospital_plantar_alcer
      t.boolean    :hospital_eye_complication
      t.boolean    :hospital_other
      t.string     :hospital_specify

      # General 
      t.date       :contact_planned  # next contact
      t.integer    :symbol_detection     # V=Volunteer, S= Survey, R=Referred, C=Contact
      t.integer    :symbol_referred      # detect==R than choices are doctor, village doctor, HealthWorker, local leader, other
      t.integer    :health_worker # need to convert to staff
      t.integer    :finder_lca
      t.integer    :symbol_disability    # WHO disability grade (0..2)
      t.integer    :symbol_chronic_disability # DI=Diabetes,TB,Other (specify)
      t.integer    :duration_years     # duration of Leprosy
      t.integer    :duration_months    # duration of Leprosy
      t.integer    :young_years   
      t.integer    :young_months 

      # Some state (update since last contact)
      t.boolean    :bcg_scar
      t.boolean    :trauma_operation  
      t.boolean    :disease
      t.string     :disease_descr    
      t.integer    :lesions           # number of skin lesions
      t.boolean    :pregnant
      t.date       :pregnancy_date
      t.boolean    :breast_feeding   
      t.boolean    :surgical_rehab
      t.boolean    :social_rehab
      t.text    :remark    
 
      t.timestamps
    end
    add_index :contacts, :person_id
  end
end
