module Guard
  class Codeception
    class Parser

      def parse(text, result = 'success')
        {
            tests:      _get(text, result, 'tests'),
            failures:   _get(text, result, 'failures'),
            assertions: _get(text, result, 'assertions'),
            errors:     _get(text, result, 'errors')
        }
      end

      private

      def _get (text, result, find)
        return text.to_s[%r{#{find.to_s}: \d+}i].to_s.split(': ')[1].to_i if result == 'error'
        text.to_s[%r{\d+\s#{find.to_s}?}i].to_s.split(' ')[0].to_i
      end
    end
  end
end