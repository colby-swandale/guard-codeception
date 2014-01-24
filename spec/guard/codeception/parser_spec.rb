require 'spec_helper'

describe Guard::Codeception::Parser do

  describe '#parse' do
    it 'should give 0 if nothing exists in the tests' do
      results = subject.parse('')
      results.each do |key, value|
        value.should eq(0)
      end
    end

    it 'should give values if they exists' do
      keys = [:tests, :assertions, :failures, :errors]

      keys.each do |key|
        results = subject.parse("foo #{key.to_s.capitalize}: 42 bar")
        results[key].should eq(42)
      end

    end
  end

end