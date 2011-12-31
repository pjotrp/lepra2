The Lepra2 database has the following layout

== Registration number ==

Every Person has a unique registration number. This number is a
string, and can be of any format. The registration number appears on
all records, related to a Person. The database itself relies on a
person.id, which is not the same as the registration number. This
implies the registration number can easily be changed.

The database schema layout is as follows:

== Person ==

Person records the unique details, such as name, registration number,
year of birth, and sex. One person has 0 or more PersonalHistory forms
(which contains the address), and 0 or more Contact forms. These in
turn refer to Assessment and Reaction forms.

== PersonalHistory ==

The personal history records non-medical mutable data, such as
address, phone and family layout. One person can have any number of
personal history mutations.

== Contact ==

Contact records contacts with the patient. The contact form specifies
the staff member, smear tests, hospital treatment, etc.  One person
can have any number of contacts. Contact belongs to Person.
Contact refers to Assessment and Reaction forms.

== Assessment ==

The assessment form contains mutable medical information, medication, and health
assessment of a patient. One person can have any number of
assessments.

== Reaction ==

Reaction contains information on a reaction (assessment). This could
be part of the Assessment form.

== Staff ==

A staff member is part of a Clinic.

== Clinic ==

A clinic has a Location.

== Address ==

Address is the address book attached to PersonalHistory. Every address
has a Location.

== Location ==

Location contains the map coordinates. This is used for geographical
study. Addresses can share a Location - as it will usually be at a
somewhat higher level than the road/village.

