require 'spec_helper'

describe Guard::Codeception::Parser do

  describe '#parse' do
    it 'should give 0 if nothing exists in the tests' do
      results = subject.parse('')
      results.each do |key, value|
        value.should eq(0)
      end
    end

    it 'should parse success result with plural words' do
        result = subject.parse("OK (4 tests, 16 assertions)")
        result[:tests].should eq(4)
        result[:assertions].should eq(16)
        result[:failures].should eq(0)
        result[:errors].should eq(0)
    end

    it 'should parse success result with singular words' do
        result = subject.parse("OK (1 test, 1 assertion)")
        result[:tests].should eq(1)
        result[:assertions].should eq(1)
        result[:failures].should eq(0)
        result[:errors].should eq(0)
    end

    it 'should parse success result with mixed plural and singular words' do
        result = subject.parse("OK (1 test, 2 assertions)")
        result[:tests].should eq(1)
        result[:assertions].should eq(2)
        result[:failures].should eq(0)
        result[:errors].should eq(0)

        result = subject.parse("OK (100 tests, 1 assertion)")
        result[:tests].should eq(100)
        result[:assertions].should eq(1)
        result[:failures].should eq(0)
        result[:errors].should eq(0)
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