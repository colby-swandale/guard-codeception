module Guard
  class Codeception
    class Runner

      require 'guard/codeception/parser'
      require 'guard/codeception/notifier'

      attr_accessor :options, :parser, :notifier

      CODECEPTION_FAILURES_EXIT_CODE  = 1
      CODECEPTION_ERRORS_EXIT_CODE    = 2

      def initialize(options = {})
        @options  = options
        @parser   = Guard::Codeception::Parser.new
        @notifier = Guard::Codeception::Notifier.new
      end

      def run
        _run if _codeception_exists?
      end

      private

      def _run
        UI.info 'Codeception: Starting Tests. Results will be displayed when finished testing.'
        output = _execute_command _codeception_command
        notifier.notify(parser.parse(output)) if $?.success?
        output
      end

      def _codeception_exists?
        %x(#{options[:codecept]} --version)
        true
      rescue Errno::ENOENT
        UI.error "codecept isn't available at #{options[:codecept]}, have you installed codeception?"
        false
      end

      def _codeception_command
        cmd = []

        cmd << options[:codecept]
        cmd << 'run'
        cmd << options[:suites].join(',')
        cmd << '-g ' + options[:groups].join(' -g ') unless options[:groups].empty?
        cmd << '--debug' if options[:debug]
        cmd << options[:cli] if options[:cli]

        cmd.join ' '
      end

      def _execute_command(command)
        %x{#{command}}
      end

    end
  end
end
