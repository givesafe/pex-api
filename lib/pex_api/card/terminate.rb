require 'pex_api/client/token'

module PexApi
  module Card
    class Terminate
      # Terminate a card account
      #
      # Returns http response
      def self.call(card_account_id='')
        _path = "Card/Terminate/#{card_account_id}"
        
        ::PexApi::Client::Token.new.post(_path)
      end
    end
  end
end

