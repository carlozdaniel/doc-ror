# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-linux]
Rails 5.2.6
* Configuration
bundle install
yarn install
* Database creation
# add code at file application.yml
development:
  username_postgres: postgres
  password_postgres: "password"
  port_postgres: "5432"
  host_postgres: localhost

* Database initialization
rake db:create
rake db:migrate
rake db:seed
* Services (job queues, cache servers, search engines, etc.)

