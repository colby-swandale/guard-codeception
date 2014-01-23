require 'guard'
require 'guard/plugin'

module Guard
  class Codeception < Plugin

    require 'guard/codeception/runner'
    require 'guard/codeception/options'

    attr_accessor :runner, :options



    def initialize(options = {})
      super
      @options  = Options.with_defaults(options)
      @runner   = Runner.new(@options)
    end

    def start
      ::Guard::UI::info 'Guard::Codeception is running'
      runner.run if options[:test_on_start]
    end

    def run_on_modifications(paths)
      runner.run
    end

    def reload
    end

    def run_all
      runner.run
    end

  end
end
