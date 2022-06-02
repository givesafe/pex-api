require 'pex_api/client/token'

module PexApi
  module Card
    class SetPin
      # Create a 4-digit PIN and associate it with a card accountID.
      #
      # Returns http response
      def self.call(card_account_id='', pin="")
        _path = "Card/SetPin/#{card_account_id}"
        
        ::PexApi::Client::Token.new.put(_path, { "Pin" => pin })
      end
    end
  end
end

