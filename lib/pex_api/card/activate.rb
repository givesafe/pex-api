require 'pex_api/client/token'

module PexApi
  module Card
    class Activate
      # Activate a card
      #
      # Returns BOOL indicating the activation was successful or not
      def self.call(card_account_id='', card_id='')
        _path = "Card/#{card_account_id}"
        _path = _path + "/#{card_id}" if card_id.present?
        
        response = ::PexApi::Client::Token.new.post(_path)
        
        response.code.to_s[0].to_i <= 2
      end
    end
  end
end

