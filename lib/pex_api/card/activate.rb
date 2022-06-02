require 'pex_api/client/token'

module PexApi
  module Card
    class Activate
      # Activate a card
      #
      # Returns http response
      def self.call(card_account_id='', card_id='')
        _path = "Card/#{card_account_id}"
        _path = _path + "/#{card_id}" if card_id.present?
        
        ::PexApi::Client::Token.new.post(_path)
      end
    end
  end
end

