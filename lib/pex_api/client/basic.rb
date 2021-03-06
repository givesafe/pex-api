require 'pex_api/client/base'

module PexApi
  module Client
    class Basic < Base

      private

      def inherited_headers
        auth_value = ::PexApi.configuration.app_base64_auth
        if auth_value.nil?
          auth_value = ""
        end
        { Authorization: "basic #{auth_value}" }
      end
    end
  end
end
