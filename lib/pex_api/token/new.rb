require 'pex_api/client/basic'

module PexApi
  module Token
    class New
      # Create a new auth token
      #
      # Returns STRING <Token | "">
      def self.call
        response = ::PexApi::Client::Basic.new.post('Token', params)
        
        return "" if response.code.to_s[0].to_i > 2
        
        JSON.parse(response.body)['Token']
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

