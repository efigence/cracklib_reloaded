# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cracklib_reloaded/version'

Gem::Specification.new do |spec|
  spec.name          = 'cracklib_reloaded'
  spec.version       = CracklibReloaded::VERSION
  spec.authors       = ['Marcin Kalita']
  spec.email         = ['rubyconvict@gmail.com']

  spec.summary       = 'Use CrackLib for Ruby to require stronger passwords.'
  spec.description   = 'CrackLib is a library for checking that a password is ' \
    'not based on a simple character pattern or on a dictionary word.'
  spec.homepage      = 'https://github.com/efigence/cracklib_reloaded'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise RuntimeError.new, 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files         =
    # `git ls-files -z`.split("\x0")
    # bundle exec manifest save
    File.read('Manifest.txt').split("\n").reject do |f|
      f.match(%r{^(test|spec|features)/})
    end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'ffi', '~> 1.9', '>= 1.9.18'

  # http://yehudakatz.com/2010/12/16/clarifying-the-roles-of-the-gemspec-and-gemfile/
  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'github_changelog_generator', '~> 0'
  spec.add_development_dependency 'fuubar', '~> 0'
  spec.add_development_dependency 'guard', '~> 0'
  spec.add_development_dependency 'guard-bundler', '~> 0'
  spec.add_development_dependency 'guard-reek', '~> 0'
  spec.add_development_dependency 'guard-rspec', '~> 0'
  spec.add_development_dependency 'guard-rubocop', '~> 0'
  spec.add_development_dependency 'rubocop', '~> 0.48.1'
  # rubocop + rubocop-rspec used by text editor from specific rvm ruby
  # gem uninstall rubocop && gem install rubocop -v='0.39'
  # https://github.com/backus/rubocop-rspec/issues/153
  spec.add_development_dependency 'rubocop-rspec', '~> 0'
  spec.add_development_dependency 'rubygems-manifest', '~> 0'
  spec.add_development_dependency 'coveralls', '0.8.19'
  spec.add_development_dependency 'simplecov', '0.12.0'
  spec.add_development_dependency 'simplecov-console', '~> 0'
  spec.add_development_dependency 'codeclimate-test-reporter', '0.4.8'
end
