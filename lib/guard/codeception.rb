require 'guard'
require 'guard/plugin'

module Guard
  class Codeception < Plugin

    autoload :Runner, 'guard/codeception/runner'

    DEFAULT_OPTIONS = {
      test_on_start:  false,
      suites:         [:acceptance, :functional, :unit],
      debug:          false,
      groups:         [],
      codecept:       'codecept',
      cli:            false
    }

    def initialize(options = {})
      @options = DEFAULT_OPTIONS.merge(options)
      super(@options)
    end

    def start
      run if options[:test_on_start]
    end

    def run_on_change(paths)
      run
    end

    def run
      Runner.run options
    end

  end
end
