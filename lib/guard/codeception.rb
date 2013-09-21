require 'guard'
require 'guard/guard'

module Guard
	class Codeception < Guard
		
		DEFAULT_OPTIONS = {
			:test_on_start 	=> false,
			:suites		=> [:acceptance, :functional, :unit],
			:debug 		=> false
		}

		def initialize(watchers = [], options = {})
			_options = DEFAULT_OPTIONS.merge(options)
			super(watchers, _options)
		end
		
		def start
			puts run if options[:test_on_start]
		end
		
		def run_on_change(paths)
			puts run
		end
	
		def run
			cmd = []
			cmd << "vendor/bin/codecept"
			cmd << "run"
			cmd << options[:suites].join(',')
			cmd << '--debug' if options[:debug]
	
			status = execute make(cmd)
			status
		end


		def make(cmd_parts)
			cmd_parts.join ' '
		end

		def execute(cmd)
			system cmd
		end
	end
end
