require 'pex_api/client/token'

module PexApi
  module Card
    class CardOrder
      # Get general information about card orders
      #
      # Returns http response
      def self.call
        ::PexApi::Client::Token.new.post("Card/CardOrder")
      end
    end
  end
end

