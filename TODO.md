## TODO

* Addresses do not load the id into contact properly on migration
* Insert person header info (as a partial) on forms
* Rename 'Back' to 'Person', and use partials
* Add first address + clinic through patient card
* Define a development testing procedure (check list)

address.person_id
  Address :belongs_to person
  Person :has_many addresses

contact.address_id
  Contact :belongs_to address
  Address :has_many contacts

Important: LEPRA is under development. Your testing and commenting is critical
to development. Please test LEPRA by modifying records.  Note that changes to
the database will be discarded later.

For your consideration:

* The screens are still barren. This can be improved on over time
* The main thing to test is the database 'model'. I.e. how the data is organised
* We need to complete patient treatment card - pending your decision on what to do with old Lepra112 fields
* A lot of fields have new naming - please check whether it can be improved
* LEPRA will be used outside Bangladesh. Therefore we should be as generic in our approach as possiple
* Current issues are listed [here](https://github.com/pjotrp/lepra2/issues)

Enjoy.

