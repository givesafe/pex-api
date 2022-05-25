require 'pex_api/client/token'

module PexApi
  module Card
    class Terminate
      # Terminate a card account
      #
      # Returns BOOL indicating the termination was successful or not
      def self.call(token, card_account_id='')
        _path = "Card/Terminate/#{card_account_id}"
        
        response = ::PexApi::Client::Token.new(token: token).post(_path)
        
        response.code.to_s.first.to_i <= 2
      end
    end
  end
end

