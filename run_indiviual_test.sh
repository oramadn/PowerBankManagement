rails db:drop RAILS_ENV=test
rails db:create RAILS_ENV=test
rails db:schema:load RAILS_ENV=test
rails db:fixtures:load RAILS_ENV=test

# Run the specific test in power_bank_test.rb
rails test test/models/station_test.rb
