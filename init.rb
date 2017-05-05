# frozen_string_literal: true

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __FILE__)

require 'rubygems'
# Set up gems listed in the Gemfile.
require 'bundler/setup'

unless defined?(RUBY_ENV)
  RUBY_ENV = [ENV['RUBY_ENV'], 'development'].compact.first.freeze
end

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, RUBY_ENV)

# binding.irb
require 'irb' if RUBY_ENV == 'development'

# require there more files from lib/my_lib/
require_relative './lib/cracklib_reloaded.rb'

password = CracklibReloaded::Password.new
password.weak?(ARGV.first)
puts 'Equivalent of ActiveModel::Errors#messages'
puts password.errors.to_h
puts password.errors.to_a.inspect
exit 1 unless password.errors.any?
