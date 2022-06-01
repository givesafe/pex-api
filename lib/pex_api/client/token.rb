require 'pex_api/client/base'
require 'pex_api/token/get'

module PexApi
  module Client
    class Token < Base
      attr_reader :token
      
      def initialize(sandbox_mode: true, token: nil)
        @url = sandbox_mode ? SANDBOX_API_URL : API_URL

        @token = token || ::PexApi.configuration.app_token
        if @token.nil?
          ::PexApi.configuration.app_token = ::PexApi::Token::Get.call
        end
      end

      private

      def inherited_headers
        { Authorization: "token #{token}" }
      end
    end
  end
end
