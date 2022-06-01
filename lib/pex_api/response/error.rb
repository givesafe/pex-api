module PexApi
  module Response
    class Error
      attr_reader :code, :status, :message,
      def initialize(rest={})
        @status = @code = rest.fetch('Code')
        
        @message = rest.fetch('Message', '')
      end
    end
  end
end
