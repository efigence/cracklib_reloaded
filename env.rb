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
require 'irb' if %w[development test].include?(RUBY_ENV)
