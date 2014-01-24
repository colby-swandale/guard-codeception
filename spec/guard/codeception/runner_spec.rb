require 'spec_helper'

describe Guard::Codeception::Runner do

  let (:runner) { Guard::Codeception::Runner.new(
      {
          test_on_start:  false,
          suites:         [:acceptance],
          groups:         [:group1],
          debug:          false,
          codecept:       Dir.getwd + '/spec/fixtures/codeception/vendor/bin/codecept',
          cli:            '-c ' + Dir.getwd + '/spec/fixtures/codeception/codeception.yml'
      }
  ) }

  describe '#run' do

    it 'calls #codeception_exists?' do
      runner.should_receive(:_codeception_exists?)
      runner.run
    end

    it 'displays error when codeception does not exist' do
      runner = Guard::Codeception::Runner.new({codecept: 'foo'})
      ::Guard::UI.should_receive(:error)
      runner.run
    end

    it 'calls system commands' do
      runner.should_receive(:`).twice # codeception check, command
      ::Guard::UI.should_receive(:info)
      runner.run
    end

  end

  describe '#_codeception_command' do

    describe 'suites' do
      it 'should create a proper system command with multiple suites' do
        test_runner = Guard::Codeception::Runner.new(runner.options.merge({suites: [:unit, :acceptance]}))
        test_runner.should_receive(:_execute_command).with("#{runner.options[:codecept]} run unit,acceptance -g group1 #{runner.options[:cli]}")
        ::Guard::UI.should_receive(:info)
        test_runner.run
      end
    end

    describe 'groups' do
      it 'should create a proper system command with multiple groups' do
        test_runner = Guard::Codeception::Runner.new(runner.options.merge({groups: [:group1, :group2]}))
        test_runner.should_receive(:_execute_command).with("#{runner.options[:codecept]} run acceptance -g group1 -g group2 #{runner.options[:cli]}")
        ::Guard::UI.should_receive(:info)
        test_runner.run
      end

      it 'should create a proper system command with no groups' do
        test_runner = Guard::Codeception::Runner.new(runner.options.merge({groups: []}))
        test_runner.should_receive(:_execute_command).with("#{runner.options[:codecept]} run acceptance #{runner.options[:cli]}")
        ::Guard::UI.should_receive(:info)
        test_runner.run
      end
    end

    describe 'debug' do
      it 'should add debug when needed' do
        test_runner = Guard::Codeception::Runner.new(runner.options.merge({debug: true}))
        test_runner.should_receive(:_execute_command).with("#{runner.options[:codecept]} run acceptance -g group1 --debug #{runner.options[:cli]}")
        ::Guard::UI.should_receive(:info)
        test_runner.run
      end

      it 'should not add debug when needed' do
        test_runner = Guard::Codeception::Runner.new(runner.options.merge({debug: false}))
        test_runner.should_receive(:_execute_command).with("#{runner.options[:codecept]} run acceptance -g group1 #{runner.options[:cli]}")
        ::Guard::UI.should_receive(:info)
        test_runner.run
      end
    end

    describe 'cli' do
      it 'should add cli option when supplied' do
        test_runner = Guard::Codeception::Runner.new(runner.options.merge({cli: '-c foo'}))
        test_runner.should_receive(:_execute_command).with("#{runner.options[:codecept]} run acceptance -g group1 -c foo")
        ::Guard::UI.should_receive(:info)
        test_runner.run
      end

      it 'should not add cli option when supplied' do
        test_runner = Guard::Codeception::Runner.new(runner.options.merge({cli: nil}))
        test_runner.should_receive(:_execute_command).with("#{runner.options[:codecept]} run acceptance -g group1")
        ::Guard::UI.should_receive(:info)
        test_runner.run
      end
    end

  end

end