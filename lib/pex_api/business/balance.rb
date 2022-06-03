require 'pex_api/client/token'

module PexApi
  module Business
    class Balance
      # Get the current balance of your PEX business account. 
      #
      # Returns http response
      def self.call()
        ::PexApi::Client::Token.new.get("Business/Balance")
      end
    end
  end
end

