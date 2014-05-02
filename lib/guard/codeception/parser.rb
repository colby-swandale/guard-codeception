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
        if result == 'error'
          text.to_s.downcase.match(%r{#{find.to_s}: \d+}).to_s.split(': ')[1].to_i
        else
          text.to_s.downcase.match(%r{\d+\s#{find.to_s}?}).to_s.split(' ')[0].to_i
        end        
      end
    end
  end
end