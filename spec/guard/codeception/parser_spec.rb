require 'spec_helper'

describe Guard::Codeception::Parser do

  describe '#parse' do

    it 'should give 0 if nothing exists in the tests' do
      results = subject.parse('')
      results.each do |key, value|
        value.should eq(0)
      end
    end

    context 'when codecept tests pass' do

      let (:codecept) { IO.read(Dir.getwd + '/spec/fixtures/results/codeception_success') }

      it 'parses the codecept run results' do
        result = subject.parse(codecept)
        expect(result).to eq({tests: 2, assertions: 2, failures: 0, errors: 0})
      end
    end

    context 'when codecept tests fail' do

      let (:codecept) { IO.read(Dir.getwd + '/spec/fixtures/results/codeception_failure') }

      it 'parses the codecept run results' do
          result = subject.parse(codecept)
          expect(result).to eq({tests: 2, assertions: 2, failures: 1, errors: 0})
      end

    end

    it 'should give values if they exists' do
      keys = [:tests, :assertions, :failures, :errors]

      keys.each do |key|
        results = subject.parse("OK #{key.to_s.capitalize}: 42 bar")
        results[key].should eq(42)
      end

    end
  end

end