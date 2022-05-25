require 'pex_api/client/base'
require 'base64'

module PexApi
  module Client
    class Basic < Base
      BASE_TOKEN = Base64.encode64(ENV['APP_ID'] + ":" + ENV['APP_SECRET'])[0...-1].freeze
      
      def initialize(sandbox_mode: true)
        @url = sandbox_mode ? SANDBOX_API_URL : API_URL
      end

      private

      def inherited_headers
        { Authorization: "basic " + self.class::BASE_TOKEN }
      end
    end
  end
end
