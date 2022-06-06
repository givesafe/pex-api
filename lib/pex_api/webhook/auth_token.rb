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
        base64_decoded = Base64.base64_decode(token)
        _id, secret = base64_decoded.split(':')
        return "badtoken" if secret.nil? or secret.empty?

        secret
      end
    end
  end
end
