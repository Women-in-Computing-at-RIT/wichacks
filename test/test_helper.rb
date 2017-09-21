if ["manual", "travis"].include?(ENV["RUN_COVERAGE"])
  require 'simplecov'
  require 'codeclimate-test-reporter' if ENV["RUN_COVERAGE"] == "travis"
  SimpleCov.add_filter 'vendor/'
  SimpleCov.add_filter 'app/mailers/mail_preview.rb'
  if ENV["RUN_COVERAGE"] == "travis"
    SimpleCov.formatters = []
    SimpleCov.start CodeClimate::TestReporter.configuration.profile
  else
    SimpleCov.start 'rails'
  end
end

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
