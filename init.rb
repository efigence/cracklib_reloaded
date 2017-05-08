# frozen_string_literal: true

require_relative 'env'
require_relative 'lib/cracklib_reloaded/password.rb'

password = CracklibReloaded::Password.new
password.weak?(ARGV.first)
puts 'Equivalent of ActiveModel::Errors#messages'
puts password.errors.to_h
puts password.errors.to_a.inspect
exit 1 if password.errors.any?
