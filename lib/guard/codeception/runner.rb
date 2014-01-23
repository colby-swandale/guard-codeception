module Guard
  class Codeception
    class Runner

      attr_accessor :options

      def initialize(options = {})
        @options = options
      end

      def run
        _run if _codeception_exists?
      end

      private

      def _run
        UI.info 'Codeception: Starting Tests'
        Kernel.system _codeception_command
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

    end
  end
end