require 'rspec/expectations'
require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'

Capybara.default_driver = :selenium
Capybara.default_wait_time = 2
Capybara.app_host = "http://localhost:3000/"

World(Capybara)
