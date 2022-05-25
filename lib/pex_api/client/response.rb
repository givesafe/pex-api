module PexApi
  module Client
    class Response
      attr_reader :code, :body
      def initialize(code=200, body='')
        @code = code
        if code >= 400
          body = { Message: body }.to_json
        end
        @body = body
      end
    end
  end
end
