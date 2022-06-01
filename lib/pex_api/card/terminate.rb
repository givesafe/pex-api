require 'pex_api/client/token'

module PexApi
  module Card
    class Terminate
      # Terminate a card account
      #
      # Returns BOOL indicating the termination was successful or not
      def self.call(card_account_id='')
        _path = "Card/Terminate/#{card_account_id}"
        
        response = ::PexApi::Client::Token.new.post(_path)
        
        response.code.to_s[0].to_i <= 2
      end
    end
  end
end

