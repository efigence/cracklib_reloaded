# frozen_string_literal: true

source 'https://rubygems.org'

gem 'ffi'

group :development do
  gem 'github_changelog_generator'
end

group :development, :test do
  gem 'fuubar'
  gem 'guard'
  gem 'guard-bundler'
  gem 'guard-reek'
  gem 'guard-rspec'
  gem 'guard-rubocop'
  gem 'rspec'
  gem 'rubocop'
  # rubocop + rubocop-rspec used by text editor from specific rvm ruby
  # gem uninstall rubocop && gem install rubocop -v='0.39'
  # https://github.com/backus/rubocop-rspec/issues/153
  gem 'rubocop-rspec'
end
