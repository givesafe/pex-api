require 'pex_api/client/base'

module PexApi
  module Client
    class Token < Base
      attr_reader :token
      
      def initialize(sandbox_mode: true, token: '')
        @url = sandbox_mode ? SANDBOX_API_URL : API_URL

        @token = token
      end

      private

      def inherited_headers
        { Authorization: "token #{token}" }
      end
    end
  end
end
