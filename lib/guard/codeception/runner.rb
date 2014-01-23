module Guard
  class Codeception
    class Runner

      attr_accessor :options

      def initialize(options = {})
        @options = options
      end

      def run
        UI.info 'Codeception: Starting Tests'

        unless codeception_exists? options[:codecept]
          UI.error "codecept isn't available at #{options[:codecept]}, have you installed codeception?"
          return false
        end

        cmd = []
        cmd << options[:codecept]
        cmd << 'run'
        cmd << options[:suites].join(',')
        cmd << '-g ' + options[:groups].join(' -g ') unless options[:groups].empty?
        cmd << '--debug' if options[:debug]
        cmd << options[:cli] if options[:cli]

        puts system make(cmd)
      end

      def codeception_exists?(codecept_path)
        %x(#{codecept_path} --version)
        true
      rescue Errno::ENOENT
        false
      end

      def make(cmd_parts)
        cmd_parts.join ' '
      end

    end
  end
end