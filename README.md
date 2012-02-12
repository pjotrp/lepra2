# LEPRA

LEPRA is a second generation database for tracking patients treated
for [leprosy](http://en.wikipedia.org/wiki/Leprosy). Lepra is designed
for the latest [Ruby on Rails](http://rubyonrails.org/), and can run
on all popular SQL database servers (we deploy the free MySQL, see
install instructions below).

The mission of LEPRA is to create allow anyone to create and maintain
database records for patients. The software is free and open source
under the liberal BSD license - for anyone to use.

LEPRA is created by [volunteers](./CONTRIBUTORS), tested by DBLM
hospital in Bangladesh.  The project is actively supported by Prof. JH
Richardus, Infectious Diseases and Public Health , Erasmus Medical
Center University, the Netherlands.

# Install and run

LEPRA runs on Linux, OSX and Windows. These are instructions for
Debian Linux:

```sh
  apt-get mysql-server-5.1 mysql-client-5.1
```sh

and setup a user with an appropriate password

```SQL
  mysql -p -u root
  CREATE DATABASE lepra2_development;
  GRANT ALL PRIVILEGES ON lepra2_development.* TO 'lepra'@'localhost'
    identified by 'lepra2';
  CREATE DATABASE lepra2_test;
  GRANT ALL PRIVILEGES ON lepra2_test.* TO 'lepra'@'localhost'
    identified by 'lepra2';
  CREATE DATABASE lepra2_production;
  GRANT ALL PRIVILEGES ON lepra2_production.* TO 'lepra'@'localhost'
    identified by 'lepra2';
  show databases;
  exit;
```

Ruby on Rails requirements (Debian Sid):

```sh
  apt-get install libmysqlclient-dev libopenssl apache2 nodejs 
```

or, on Debian stable

```sh
  apt-get install  libmysqlclient-dev libopenssl-ruby1.9.1 apache2 
```
  
Run (you probably want to use rvm)

```sh
  rvm install ruby-1.9.2-p290
  rvm use 1.9.2
```

Check whether the versions match

```sh
  gem env    
```

Checkout the most recent source tree using git

```sh
  apt-get install git-core
  git clone https://github.com/pjotrp/lepra2.git
```

Install all 'bundled' Ruby gems:

```sh
  gem install bundler
  bundle
  gem list
```

Start the webserver on port 8080

```sh
  bundle exec rails server -p 8080
```

# Literature

Publications of interest:

  The spatial distribution of leprosy cases during 15 years of a leprosy control program in Bangladesh: An observational study
  EAJ Fischer, D Pahan, SK Chowdhury and JH Richardus
  BMC Infectious Diseases 2008, 8:126 doi:10.1186/1471-2334-8-126
  http://www.biomedcentral.com/1471-2334/8/126

  A clinical prediction rule for nerve-function impairment in leprosy patients.
  Croft RP, Nicholls PG, Steyerberg EW, Richardus JH, Cairns W, Smith S
  Lancet. 2000 May 6;355(9215):1603-6.
  http://www.ncbi.nlm.nih.gov/pubmed/10821364

  Active surveillance in leprosy: how useful is it? 
  Richard Croft
  Lepr Rev. 1996 Jun;67(2):135-40.
  http://www.ncbi.nlm.nih.gov/pubmed/8684254

# LICENSE

Lepra is distributed under the BSD License. See LICENSE.txt

Copyright (C) 2012 Pjotr Prins <pjotr.prins@thebird.nl>
