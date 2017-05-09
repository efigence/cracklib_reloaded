# CracklibReloaded

CrackLib is a library for checking that a password is not based on a simple character pattern or on a dictionary word.

## Installation

```
$ rvm use ruby-2.4
```

Add this line to your application's Gemfile:

```ruby
gem 'cracklib_reloaded'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cracklib_reloaded

## Usage

```
password = CracklibReloaded::Password.new
password.weak?('admin123')
=> true
> password.errors
=> #<CracklibReloaded::Password::Errors
# Equivalent of ActiveModel::Errors#messages'
> password.errors.to_h
=> {:password=>["it is based on a dictionary word"]}
> password.errors.to_a
[[:password, ["it is based on a dictionary word"]]]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

```
$ guard #  require './lib/cracklib_reloaded'
```

## Run script

CAUTION: Using password as a script argument may not safe

```
$ ruby init.rb 'admin123'
Equivalent of ActiveModel::Errors#messages
{:password=>["it is based on a dictionary word"]}
[[:password, ["it is based on a dictionary word"]]]
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/efigence/cracklib_reloaded. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
