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
      attr_reader :token
      
      def initialize(token: nil)
        @token = token || ::PexApi.configuration.app_token
        if @token.nil? or (@token.has_key?('TokenExpiration') && DateTime.parse(@token['TokenExpiration']) < DateTime.now.next_month)
          @token = ::PexApi::Token::Get.call
        end
        ::PexApi.configuration.app_token = @token
      end

      private

      def inherited_headers
        { Authorization: "token #{token['Token']}" }
      end
    end
  end
end
