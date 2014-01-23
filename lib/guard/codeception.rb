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
      _show_start_message
      runner.run if _should_test_on_start?
    end

    def run_on_modifications(paths)
      puts runner.run
    end

    def reload
    end

    def run_all
      puts runner.run
    end

    private

    def _show_start_message
      ::Guard::UI::info 'Guard::Codeception is running'
    end

    def _should_test_on_start?
      options[:test_on_start]
    end

  end
end
