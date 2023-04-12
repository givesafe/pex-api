require 'pex_api/client/token'

module PexApi
  module Card
    class Activate
      ##
      # Activate a card using the card accountID.
      #
      # A card must be activated before the cardholder can spend. 
      # For security reasons, you should not activate a card until it is received by the cardholder.
      #
      # The PEX system will prevent you from activating a card within 24 hours of creation.
      #
      # NOTE: If the card is a replacement for an existing, damaged or expiring card,
      #         you should use the endpoint /Card/Activate/{id}/{cardid} and make sure
      #         the cardholder has the new card prior to activating it.
      #       Card activation immediately terminates all other cards on the account,
      #         including the one the cardholder is currently using. 
      #       The card termination process is immediate and NOT reversible.
      # 
      # @param card_account_id [String] The ID of the card account.
      # @param card_id [String] The ID of the card.
      #
      # @returns 200 {}
      # @returns 403 { description: 'Invalid card account ID' }
      # @returns 403 { description: 'Cannot change status' }
      #
      # when @param card_id is present
      # @ returns 403 { description: 'Invalid card account ID' }
      # @ returns 403 { description: 'Invalid card ID' }
      # @ returns 403 { description: 'Cannot change status' }
      def self.call(card_account_id='', card_id='')
        _path = "Card/Activate/#{card_account_id}"
        _path = _path + "/#{card_id}" if card_id.present?
        
        ::PexApi::Client::Token.new.post(_path)
      end
    end
  end
end

