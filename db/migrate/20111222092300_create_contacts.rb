class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.belongs_to :person
      t.references :staff
      t.date       :date
      t.string     :patient_type  # Type of patient (BT,BB,BL.LL.TT, I)
      t.string     :out           # (B=BANDS pts, transfered, N=Out of Control,D=Died)
      t.integer    :status        # (1= mono, 2=pb mdt, 3=MB mdt,4=RFT PB, 5= RFT MB, 6=RFC, 8=RFT mono)
                                  # MDT = multi drug therapy
                                  # RFT = release from treatment
                                  # RFC = release from control

      t.string     :treatment     # M/MB= Multibacillary treatment, P/PB= Pacibacillary
      t.integer    :doses         # No.of doses (number of months of MDT)
      t.date       :mdt_date      # default to regdate
      t.integer    :smearf        # first time smear (0= smear negative,1,2,3,4,5,6 = smear positive, 9=no smear) This value does not change
      t.date       :smearf_date
      t.integer    :smear         # last time smear (0= smear negative,1,2,3,4,5,6 = smear positive, 9=no smear) 
      t.date       :smear_date
      t.date       :rft_date



      # General 
      t.date       :contact_planned  # next contact
      t.string     :detection     # V=Volunteer, S= Survey, R=Referred, C=Contact
      t.string     :referred      # detect==R than choices are doctor, village doctor, HealthWorker, local leader, other
      t.string     :disability    # WHO disability grade (0..2)
      t.timestamps
    end
  end
end
