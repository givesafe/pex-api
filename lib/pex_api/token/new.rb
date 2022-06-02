require 'pex_api/client/basic'

module PexApi
  module Token
    class New
      # Create a new auth token
      #
      # Returns http response
      def self.call
        ::PexApi::Client::Basic.new.post('Token', params)
      end

      private

      def self.params
        {
          "Username": ::PexApi.configuration.username,
          "Password": ::PexApi.configuration.password
        }
      end

    end
  end
end

