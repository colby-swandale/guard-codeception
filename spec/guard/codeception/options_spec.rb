require 'spec_helper'

describe Guard::Codeception::Options do

  describe '#with_defaults' do
    it 'should have defaults if no overrides are provided' do
      defaults = subject.with_defaults({})
      defaults.should eq(Guard::Codeception::Options::DEFAULTS)
    end
    it 'should override defaults with provided options' do
      expected  = Guard::Codeception::Options::DEFAULTS.merge({test_on_start: true})
      defaults  = subject.with_defaults({test_on_start: true})
      defaults.should eq(expected)
    end
  end

end