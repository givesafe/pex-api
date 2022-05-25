require 'pex_api/client/basic'

module PexApi
  module Token
    class New
      # Create a new auth token
      #
      # Returns STRING <Token | "">
      def self.call
        response = ::PexApi::Client::Basic.new.post('Token', params)
        
        return "" if response.code.to_s.first.to_i > 2
        
        JSON.parse(response.body)['Token']
      end

      private

      def self.params
        {
          "Username": ENV['API_USERNAME'],
          "Password": ENV['API_PASSWORD']
        }
      end

    end
  end
end

