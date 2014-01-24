module Guard
  class Codeception
    class Notifier

      TITLE = 'Codeception Results'

      def notify(results)
        image     = _image(results)
        message   = _message(results)
        ::Guard::Notifier::notify(message, {title: TITLE, image: image})
      end

      private

      def _image(results)
        return :failed if results[:failures] > 0
        return :failed if results[:errors] > 0
        :success
      end

      def _message(results)
        message = "#{results[:tests]} tests\n"
        message << "#{results[:assertions]} assertions\n"
        message << "#{results[:failures]} failures\n"
        message << "#{results[:errors]} errors\n"
        message
      end

    end
  end
end