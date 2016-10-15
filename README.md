# Unmaintained
This repo is no longer being maintained by the original author.

# Guard::Codeception [![Build Status](https://travis-ci.org/colby-swandale/guard-codeception.png?branch=master)](https://travis-ci.org/colby-swandale/guard-codeception) [![Coverage Status](https://coveralls.io/repos/colby-swandale/guard-codeception/badge.png?branch=master)](https://coveralls.io/r/colby-swandale/guard-codeception)

Guard::Codeception is an extension to the [guard gem](http://guardgem.org/) for the [codeception](http://codeception.com/) testing framework 

## Installation
```
$ gem install guard-codeception 
```

Or add this line to your application's Gemfile:
```ruby
gem 'guard-codeception'
```
And then execute:
```
$ bundle
```

## Guardfle
The Guardfile can be generated from `$ guard init codeception`. By default Guard::Codeception will listen to any changes to PHP files only but you can alter the regex to your needs.

```ruby
guard 'codeception' do
	watch(%r{^.*\.php$})
end
```

## Configuration
The following options can be passed to Guard::Codeception

```ruby
# run only specified suites 		default: [:acceptance, :functional, :unit]
:suites			=> [:acceptence, :custom_suite]

# run specific test group 			default: []
:groups			=> [:foo, :bar]

# enable codeception debug mode 	default: false
:debug 			=> false

# run tests when guard starts		default: false
:test_on_start 	=> false

# path to codecept					default 'codecept'
# if codecept is not avaliable via the PATH you can
# define the path to codecept here. ie: installing codeception
# via composer would be :codecept => 'vendor/bin/codecept'
:codecept		=> '/path/to/codecept'

# extra cli you wish to pass to codeceeption
# ie: config, json or xml output
:cli 			=> false
```

## Usage
```bash
$ guard
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Test your changes with `rspec`
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request


## Testing
You need to pull codeception from composer under `spec/fixtures/codeception` with `composer install --dev`, then run `rspec`.

## Author

[Colby Swandale](https://github.com/colby-swandale)

## Contributors

[tmuntan1](https://github.com/tmuntan1)

