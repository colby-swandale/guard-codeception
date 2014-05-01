module Guard
  class Codeception
    class Parser

      def parse(text)
        {
            tests:      _get(text, 'Tests|tests'),
            failures:   _get(text, 'Failures|failures'),
            assertions: _get(text, 'Assertions|assertions'),
            errors:     _get(text, 'Errors|errors')
        }
      end

      private

      def _get (text, find)
        begin
          text.to_s.match(%r{(?<count>\d+)?\ ?(#{find.to_s})(\: (?<count>\d+))?})[:count].to_i
        rescue NoMethodError
          0
        end
      end

    end
  end
end