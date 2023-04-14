require 'pex_api/client/base'
require 'pex_api/token/get'

module PexApi
  module Client
    # 3 ways to get a token.
    #
    # First you can directly input a token in the initializer
    # If none in the initializer, then we look in the cached configuration variable.
    # If none in the cached configuration variable or the cached variable will expire soon, get a token and cache it.
    class Token < Base
      attr_reader :token_object
      
      def initialize(token: nil)
        @token_object = token || ::PexApi.configuration.app_token
        if token.nil?
          @token_object = ::PexApi::Token::Get.call
          ::PexApi.configuration.app_token = @token_object
        end
      end

      private

      def inherited_headers
        { Authorization: "token #{token_object['Token']}" }
      end
    end
  end
end
