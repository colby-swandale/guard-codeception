require 'spec_helper'

describe Guard::Codeception::Runner do

  let (:default_options) { {
      test_on_start:  false,
      suites:         [:acceptance],
      groups:         [:group1],
      debug:          false,
      codecept:       Dir.getwd + '/spec/fixtures/codeception/vendor/bin/codecept',
      cli:            '-c ' + Dir.getwd + '/spec/fixtures/codeception/codeception.yml'
  } }

  describe '#run' do

    # TODO: test #make

    it 'calls #codeception_exists?' do
      subject.should_receive(:codeception_exists?)
      subject.run default_options
    end
  end

  describe '#codeception_exists?' do

    context 'when codecept not found' do

      it 'returns false' do
        expect(subject.codeception_exists?('notcodecept')).to be_false
      end
    end

    it 'returns true' do
      expect(subject.codeception_exists?(default_options[:codecept])).to be_true
    end
  end

  describe '#make' do

    it 'returns the command for #system to execute' do
      cmd = subject.make %w[codecept run foo,bar]
      expect(cmd).to eq('codecept run foo,bar')
    end
  end

end