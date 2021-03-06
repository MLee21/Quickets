# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/poltergeist' 
Capybara.javascript_driver = :poltergeist 

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
 config.include FeatureSpecHelper
end

OmniAuth.config.test_mode = true


ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = false


  config.infer_spec_type_from_file_location!
end

RSpec.configure do |config|
  # any port can be used
  Capybara.server_port = 3000
  Ngrok::Rspec.tunnel = { port: Capybara.server_port }

  config.include Ngrok::Rspec
end

