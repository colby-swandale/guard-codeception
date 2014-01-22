module Guard
  class Codeception
    module Runner

      class << self

        def run(options = {})
          UI.info 'Starting Tests'

          unless codeception_exists? options[:codecept]
            UI.error 'codecept isnt\'t avaliable, have you installed codeception?'
            return false
          end

          cmd = []
          cmd << options[:codecept]
          cmd << 'run'
          cmd << options[:suites].join(',')
          cmd << '-g ' + options[:groups].join(' -g ') if !options[:groups].empty?
          cmd << '--debug' if options[:debug]
          cmd << options[:cli] if options[:cli]

          UI.info execute make(cmd)
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

        def execute(cmd)
          %x(#{cmd})
        end

      end

    end
  end
end