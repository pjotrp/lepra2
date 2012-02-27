## TODO

Important: LEPRA is under development. Your testing and commenting is critical
to proceeding. Please test LEPRA by modifying records.  Note that changes to
the database will be discarded later.

For your consideration:

* The screens are barren and simply laid out. This can be improved on over time
* The main thing to test is the database 'model'. I.e. how the data is organised
* We need to complete patient treatment card - pending your decision on what to do with old Lepra112 fields
* A lot of fields have new naming - please check whether it can be improved
* LEPRA will be used outside Bangladesh. Therefore we should be as generic in our approach as possiple

Questions: 

* Please answer the questions I sent in the E-mail of Feb 13th
* Should the current Assessment/Physical examination record be split further?
* Should MDT treatment be in contact/medical?

## Comments 

   hag - should be lag, short for lagophthalmos
   facila (reaction form) - should be facial
   planter (assessment form) should be plantar
   prednisolon should be prednisolone

   Avoid the true/false 

   Eye closure gap should have units ie. mm

   Do not use 'common' or 'posterior'. These are abbreviations for 'common
   peroneal nerve' and 'posterior tibial nerve'. Better, 'C peroneal nerve'
   or 'Post tibial nerve' or even CP nerve and PT nerve

## Next

We need to add 

* Symbol table support (symbols are fields with limited values, such as a choice of Child, Mother, Father)
* Add more automated tests for main pages
* Use the address book, including
* load village names etc from mdb table, e.g. 
    mdb-export -I commondata.mdb tblUpazila
    [link](http://nialldonegan.me/2007/03/10/converting-microsoft-access-mdb-into-csv-or-mysql-in-linux/)
* hands & feet figure for entering data

Enjoy.

