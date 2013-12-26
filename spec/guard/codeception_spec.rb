require 'spec_helper'

describe Guard::Codeception do

	let (:runner) { Guard::Codeception::Runner }

	describe '#initialize' do

		context 'when no options are provided' do

			it 'has :test_on_start set to false' do
				expect(subject.options[:test_on_start]).to be_false
			end

			it 'has :suites set to [:acceptance, :functional, :unit]' do
				expect(subject.options[:suites]).to match_array([:acceptance, :functional, :unit])
			end

			it 'has :debug set to false' do
				expect(subject.options[:debug]).to be_false
			end

			it 'has :groups set to []' do
				expect(subject.options[:groups]).to match_array([])
			end
		end

		context 'when options are provided' do

			subject do
				Guard::Codeception.new test_on_start: true, suites: [:foo], debug: true, groups: [:bar] 
			end

			it 'has :test_on_start set to true' do
				expect(subject.options[:test_on_start]).to be_true
			end

			it 'has suites set to []' do
				expect(subject.options[:suites]).to match_array([:foo])
			end	

			it 'has debug set to true' do
				expect(subject.options[:debug]).to be_true
			end

			it 'has groups set to [:foo]' do
				expect(subject.options[:groups]).to match_array([:bar])
			end
		end
	end

	describe '#start' do

		it 'should\'t call #run' do
			subject.should_not_receive :run
			subject.start
		end

		context 'with :run_on_start set to true' do

			subject do
				Guard::Codeception.new test_on_start: true
			end

			it 'should call #run' do
				subject.should_receive :run
				subject.start
			end
		end
	end

	describe '#runs_on_change' do

		it 'should call #run' do
			subject.should_receive :run
			subject.run_on_change []
		end
	end

	describe '#run' do

		it 'should call Runner#run' do
			runner.should_receive :run
			subject.run
		end
	end
end