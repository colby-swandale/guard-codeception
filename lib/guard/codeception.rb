require 'guard'
require 'guard/plugin'

module Guard
  class Codeception < Plugin

    require 'guard/codeception/runner'

    attr_accessor :runner, :options

    DEFAULT_OPTIONS = {
      test_on_start:  false,
      suites:         [:acceptance, :functional, :unit],
      debug:          false,
      groups:         [],
      codecept:       'codecept',
      cli:            false
    }

    def initialize(options = {})
      super

      @options  = DEFAULT_OPTIONS.merge(options)
      @runner   = Runner.new(@options)
    end

    def start
      ::Guard::UI::info 'Guard::Codeception is running'
      runner.run if options[:test_on_start]
    end

    def run_on_modifications(paths)
      display_paths(paths)
    end

    def reload
    end

    def run_all
      runner.run
    end

    def display_paths(paths)
      paths.each do |path|
        puts path
      end
    end

  end
end
