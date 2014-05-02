module Guard
  class Codeception
    module Options

      DEFAULTS = {
          test_on_start:     false,
          suites:            [:acceptance, :functional, :unit],
          debug:             false,
          groups:            [],
          codecept:          'codecept',
          cli:               false,
          notify_on_error:   true,
          notify_on_success: true
      }

      class << self
        def with_defaults(options={})
          DEFAULTS.merge(options)
        end
      end

    end
  end
end