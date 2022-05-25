require 'pex_api/client/token'

module PexApi
  module Card
    class SetPin
      # Fund a specified card accountID to zero ($0).
      #
      # Specify a card accountID and funds from the business account will be added/removed so that the card account (available) balance = $0.00.
      #
      # Returns BOOL indicating transfer was successful set or not
      def self.call(token, card_account_id='')
        _path = "Card/Zero/#{card_account_id}"
        
        response = ::PexApi::Client::Token.new(token: token).post(_path)
        
        response.code.to_s.first.to_i <= 2        
      end
    end
  end
end
