module Guard
  class Codeception
    class Parser

      def parse(text)
        {
            tests:      _get(text, 'tests'),
            failures:   _get(text, 'failures'),
            assertions: _get(text, 'assertions'),
            errors:     _get(text, 'errors')
        }
      end

      private

      def _get (text, find)
        begin
          text.to_s.match(/(FAILURES!\n|OK ).*?(?<count>\d+)? ?#{find.to_s}?(: (?<count>\d+))?/i)[:count].to_i
        rescue NoMethodError
          0
        end
      end

    end
  end
end