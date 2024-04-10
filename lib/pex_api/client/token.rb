require 'pex_api/client/base'
require 'pex_api/token/get'

module PexApi
  module Client
    # 3 ways to get a token.
    #
    # First you can directly input a token in the initializer
    # If none in the initializer, then we look in the cached configuration variable.
    # If none in the cached configuration variable, get a new token and cache it.
    class Token < Base
      attr_reader :token_object
      
      def initialize(token: nil)
        @token_object = token || ::PexApi.configuration.app_token
        if @token_object.nil?
          response = ::PexApi::Token::New.call

          if response.code.to_s[0].to_i == 2
            @token_object = JSON.parse(response.body)['Token']
          end
          ::PexApi.configuration.app_token = @token_object
        end
      end

      private

      def inherited_headers
        { Authorization: "token #{token_object}" }
      end
    end
  end
end
