class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      # Contact table holds information relevant for each patient contact.
      # This table includes applied treatments. A few characteristics may
      # be listed and updated here, such as lesions.
      #
      # See also the Assessment and Reaction tables for patient state.
      t.belongs_to :person
      t.string     :registration # read-only
      t.date       :date
      t.integer    :clinic_id
      t.integer    :staff_id
      t.string     :symbol_patient_type    # Type of patient (BT,BB,BL.LL.TT, I)
      t.string     :symbol_patient_status  # (B=BANDS pts, T=Transferred, N=Out of Control,D=Died)
      t.boolean    :final_assessment
      t.string     :symbol_medication      # (1= mono, 2=pb mdt, 3=MB mdt,4=RFT PB, 5= RFT MB, 6=RFC, 8=RFT mono)
                                  # MDT = multi drug therapy
                                  # RFT = release from treatment
                                  # RFC = release from control

      t.string     :symbol_treatment     # M/MB= Multibacillary treatment, P/PB= Pacibacillary
      t.integer    :mdt_dose      # No.of doses (number of months of MDT)
      t.date       :mdt_date      # start date
      t.date       :rft_date
    
      # medication
      t.boolean    :prednisolone   # low dose
      t.boolean    :diy
      t.string     :diy_specify   # new field
      t.boolean    :hospital_admission
      t.string     :hospital_name # if not DBLM
      t.boolean    :hospital_neuritis
      t.boolean    :hospital_plantar_alcer    
      t.boolean    :hospital_eye_complication 
      t.boolean    :hospital_other            
      t.string     :hospital_specify          

      # General 
      t.date       :contact_planned  # next contact
      t.string     :symbol_detection     # V=Volunteer, S= Survey, R=Referred, C=Contact
      t.string     :symbol_referred      # detect==R than choices are doctor, village doctor, HealthWorker, local leader, other
      t.integer    :health_worker # need to convert to staff
      # t.integer    :finder_lca  in PersHistory
      t.integer    :symbol_who_disability    # WHO disability grade (0..2)
      t.string     :symbol_chronic_disability # DI=Diabetes,TB,Other (specify)
      t.integer    :duration_years     # duration of Leprosy
      t.integer    :duration_months    # duration of Leprosy
      t.integer    :young_years   
      t.integer    :young_months 

      # Some state (update since last contact)
      t.boolean    :bcg_scar
      t.boolean    :trauma_operation  
      t.boolean    :disease
      t.string     :symbol_disease_descr    
      t.integer    :lesions           # number of skin lesions
      t.boolean    :pregnant
      t.date       :pregnancy_date
      t.boolean    :breast_feeding   
      t.boolean    :surgical_rehab
      t.boolean    :social_rehab
      t.integer    :symbol_final_who_disability    # WHO disability grade (0..2)
      t.integer    :final_disability
      t.date       :final_date

      t.text    :remark    
 
      t.timestamps
    end
    add_index :contacts, :person_id
  end
end
