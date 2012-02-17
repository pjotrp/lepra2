# Introduction to LEPRA

LEPRA consists of a relational database and a Ruby on Rails webserver.
The basic database schema layout is explained
[here](https://github.com/pjotrp/lepra2/blob/master/doc/README_FOR_APP.md).

This section gives a guided tour of LEPRA.

## Logging in

Login with your E-mail address and password. The database is
protected from the outside world and requires authentication.

Future versions will allow new administrators to create new databases.
So all users will work in separate protected environments by default.

## Search

Hit the |Search| tag on the menu. Depending on the content of your
database you should see up to 100 users listed here. 

In the search field you can type the registration number, or the name.
Searching for 'Ham' will match Hamonta, Hamidul etc. 

A partial search will search anywhere in the number or name.

Searching should be very fast, whatever the size of the database.

## Person

Clicking on a person name will take you to the Person record, which
contains fields that are normally not mutated, such as name and
registration number, and exist only once in the database. You should
see two links 'Edit', which allows editing the record, and 'Back',
which takes you back to Search.

A person can have zero or more

* Personal histories
* Contacts (visits/medical history)
* Assessments (examinations)
* Reactions
* Addresses






