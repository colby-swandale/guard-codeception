require 'spec_helper'

describe Guard::Codeception::Parser do

  describe '#parse' do
    it 'should give 0 if nothing exists in the tests' do
      results = subject.parse('')
      results.each do |key, value|
        value.should eq(0)
      end
    end

    it 'should give values if they exist in case of success' do
        results = subject.parse("OK (4 tests, 16 assertions)")
        results[:tests].should eq(4)
        results[:assertions].should eq(16)
        results[:failures].should eq(0)
        results[:errors].should eq(0)
    end

    it 'should give values if they exist in case of failures' do
      keys = [:tests, :assertions, :failures, :errors]

      keys.each do |key|
        results = subject.parse("foo #{key.to_s}: 42 bar", 'error')
        results[key].should eq(42)
      end

    end
  end

end