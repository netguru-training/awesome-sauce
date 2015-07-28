BlaBla Plus
================

[![Build Status](https://travis-ci.org/netguru-training/awesome-sauce.svg?branch=master)](https://travis-ci.org/netguru-training/awesome-sauce)

## Description

Are you a driver? Want to lower costs of travelling and you've got plenty of space left in you car?
Find other people travelling to your destination place and let them chip in for fuel.

Are you a traveller? You don't own a car or a driving license?
Find driver who is travelling same way and chip in for fuel.

BlaBla Plus connects drivers with potential passengers to reduce costs of travelling.
Log in, register your trip and let other users join you.
Or, if you feel like not moving your car today, log in and search for drivers going same way.

## Details

We use:

Ruby 2.2.0
Rails 4.2.0
PostgreSQL

## Setup

Follow these steps to setup the application:

#### Step 0: get the source code
```
$ git clone git@github.com:netguru-training/awesome-sauce.git
```

#### Step 1: Install gems
```
$ bundle install
```

#### Step 2: Copy database
Create a renamed copy of the `database.yml.example` file in the `config` folder.
```
  $ cp config/database.yml.example config/database.yml
```

#### Step 3: Create database and run migrations
```
$ rake db:setup
```

## Test
To test Rails controllers and models:
```
$ rspec
```

#### Preview
You can see the app in action at [*awesome-sauce-ng.herokuapp.com*](https://awesome-sauce-ng.herokuapp.com)

######IMPORTANT

Any resemblance to names and/or trademarks of real companies, operating or not, is purely coincidental.
