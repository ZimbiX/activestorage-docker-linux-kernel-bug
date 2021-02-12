#!/bin/bash

bundle exec bash -c 'RAILS_ENV=test rake db:setup && rails test --backtrace'
