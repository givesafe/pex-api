require 'pex_api/client/token'

module PexApi
  module Card
    class Fund
      # Fund a card
      #
      # Returns BOOL indicating the activation was successful or not
      def self.call(token, card_account_id='', amount=0, text="")
        return nil if amount == 0
        _path = "Card/Fund/#{card_account_id}"

        _params = { Amount: amount }
        _params[:NoteText] = text if text.present? && !text.empty?
        
        response = ::PexApi::Client::Token.new(token: token).post(_path, _params)
        
        response.code.to_s.first.to_i <= 2
      end
    end
  end
end

