module Guard
  class Codeception
    class Parser

      def parse(text)
        {
            tests:      _get(text, 'Tests'),
            failures:   _get(text, 'Failures'),
            assertions: _get(text, 'Assertions'),
            errors:     _get(text, 'Errors')
        }
      end

      private

      def _get (text, find)
        text.to_s.match(%r{#{find.to_s}: \d+}).to_s.split(': ')[1].to_i
      end

    end
  end
end