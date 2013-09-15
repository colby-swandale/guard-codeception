## Note: This gem is in alpha 
# TODO:
- Create test cases
- Handle all Codeception options
- Profit?

# Guard::Codeception

Guard::Codeception is an extension to the [guard gem](http://guardgem.org/) for the [codeception](http://codeception.com/) testing framework 

## Installation

Add this line to your application's Gemfile:

    gem 'guard-codeception', :git => 'https://github.com/colby-swandale/guard-codeception'

And then execute:

    $ bundle

## Example Guardfle

```ruby
guard 'codeception' do
	watch(%r{^.*\.php$})
end
```

## Usage
- Make sure you have codeception installed in your project via [composer](http://getcomposer.org/)
- Create Guardfile, see example above

```bash
$ guard
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Author

[Colby Swandale](https://github.com/colby-swandale)

