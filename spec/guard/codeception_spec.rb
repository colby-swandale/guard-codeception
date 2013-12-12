require 'spec_helper'

describe Guard::Codeception do

	describe '#initialize' do

		context 'when no options are provided' do

			it 'has :test_on_start set to false' do
				subject.options[:test_on_start].should == false
			end

			it 'has :suites set to [:acceptance, :functional, :unit]' do
				subject.options[:suites].should == [:acceptance, :functional, :unit]
			end

			it 'has :debug set to false' do
				subject.options[:debug].should == false
			end

			it 'has :groups set to []' do
				subject.options[:groups].should == []
			end
		end

		context 'when options are provided' do

			subject do
				Guard::Codeception.new test_on_start: true, suites: [], debug: true, groups: [:foo] 
			end

			it 'has :test_on_start set to true' do
				subject.options[:test_on_start].should == true
			end

			it 'has suites set to []' do
				subject.options[:suites].should == []
			end	

			it 'has debug set to true' do
				subject.options[:debug].should == true
			end

			it 'has suites set to [:foo]' do
				subject.options[:groups].should == [:foo]
			end
		end
	end

	describe '#start' do

		it 'should\'t call #run_all' do
			subject.should_not_receive(:run_all)
			subject.start
		end

		context 'with :run_on_start set to true' do

			subject do
				Guard::Codeception.new test_on_start: true
			end

			it 'should call #run_all' do
				subject.should_receive(:run)
				subject.start
			end
		end
	end
end