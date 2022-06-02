require 'pex_api/client/token'

module PexApi
  module Card
    class Fund
      # Fund a card
      #
      # Returns http response
      def self.call(card_account_id='', amount=0, text="")
        return nil if amount == 0
        _path = "Card/Fund/#{card_account_id}"

        _params = { Amount: amount }
        _params[:NoteText] = text if text.present? && !text.empty?
        
        ::PexApi::Client::Token.new.post(_path, _params)
      end
    end
  end
end

