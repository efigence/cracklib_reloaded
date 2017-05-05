## Cracklib reloaded

## Install

```
$ rvm use ruby-2.4
$ bundle install
```

## Use

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

## Develop

```
$ guard # require './init.rb'
```

## Run script

CAUTION: Using password as a script argument may not safe

```
$ ruby init.rb 'admin123'
Equivalent of ActiveModel::Errors#messages
{:password=>["it is based on a dictionary word"]}
[[:password, ["it is based on a dictionary word"]]]
```
