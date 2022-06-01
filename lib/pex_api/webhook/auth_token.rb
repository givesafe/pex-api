require 'base64'

module PexApi
  module Webhook
    class AuthToken
      attr_reader :token
      def initialize(token)
        @token = token
      end

      def is_valid?
        decoded_token == ::PexApi.configuration.app_secret
      end

      private

      def decoded_token
        Base64.base64_decode(token)
      end
    end
  end
end
