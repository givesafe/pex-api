require 'pex_api/client/token'

module PexApi
  module Card
    class SetPin
      # Fund a specified card accountID to zero ($0).
      #
      # Specify a card accountID and funds from the business account will be added/removed so that the card account (available) balance = $0.00.
      #
      # Returns http response
      def self.call(card_account_id='')
        _path = "Card/Zero/#{card_account_id}"
        
        ::PexApi::Client::Token.new.post(_path) 
      end
    end
  end
end
