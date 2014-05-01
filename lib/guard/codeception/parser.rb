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
          if find.to_s == 'tests' 
            text.to_s.downcase.match(%r{#{'ok ('}#{/.+/}#{')'}}).to_s.split(%r{#{/\D/}}).reject(&:empty?)[0].to_i
          elsif find.to_s == 'assertions'
            text.to_s.downcase.match(%r{#{'ok ('}#{/.+/}#{')'}}).to_s.split(%r{#{/\D/}}).reject(&:empty?)[1].to_i
          else
            0
          end
        end        
      end
    end
  end
end