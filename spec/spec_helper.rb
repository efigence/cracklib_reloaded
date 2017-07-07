# frozen_string_literal: true

if ENV['CI']
  require 'codeclimate-test-reporter'
  require 'coveralls'
  require 'simplecov-console'

  formatter = [
    CodeClimate::TestReporter::Formatter,
    Coveralls::SimpleCov::Formatter,
    SimpleCov::Formatter::Console,
    SimpleCov::Formatter::HTMLFormatter
  ]
  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(formatter)
else
  require 'simplecov'
end
SimpleCov.start

RUBY_ENV = 'test'

require 'bundler/setup'
require 'cracklib_reloaded'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.order = :random
end
