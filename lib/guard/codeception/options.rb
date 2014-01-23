module Guard
  class Codeception
    module Options

      DEFAULTS = {
          test_on_start:  false,
          suites:         [:acceptance, :functional, :unit],
          debug:          false,
          groups:         [],
          codecept:       'codecept',
          cli:            false
      }

      class << self
        def with_defaults(options={})
          DEFAULTS.merge(options)
        end
      end

    end
  end
end