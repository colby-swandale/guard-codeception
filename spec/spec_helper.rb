require 'simplecov'

SimpleCov.start do
  add_filter '/spec/'
  add_group 'Codeception', 'lib/guard'
end

require 'rspec'
require 'guard/codeception'
require 'coveralls'
Coveralls.wear!

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered                = true
  config.order                                           = :random

  config.filter_run :focus
end
