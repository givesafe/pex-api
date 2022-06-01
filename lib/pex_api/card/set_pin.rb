require 'pex_api/client/token'

module PexApi
  module Card
    class SetPin
      # Create a 4-digit PIN and associate it with a card accountID.
      #
      # Returns BOOL indicating the pin was successful set or not
      def self.call(card_account_id='', pin="")
        _path = "Card/SetPin/#{card_account_id}"
        
        response = ::PexApi::Client::Token.new.put(_path, { "Pin" => pin })
        
        response.code.to_s[0].to_i <= 2
      end
    end
  end
end

