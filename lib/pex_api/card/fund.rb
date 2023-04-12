require 'pex_api/client/token'

module PexApi
  module Card
    class Fund
      ##
      # Add or remove funds to/from a card accountID.
      # 
      # NOTE: - Card funding is in real-time and will change the cardholder's available balance immediately.
      #       - To remove funds from the card balance, enter a negative number, for example: -10.00 will remove $10.00 from the card available balance.
      #       - Padding for Restaurant: At non-fast food locations, card authorization is (typically) for total plus 20% of total (ex. bill total $56.00 + $11.20 (20%) = $67.20 authorization amount). If the cardholder spends at restaurants, please be sure to allow for the additional 20%.
      #       - Gas Purchases at Automated Fuel Dispensers (AFDs): AFDs will authorize for a minimum $50.00 and settle for the amount of gas pumped (whether the purchase is above or below $50.00).
      # 
      # To retrieve the card accountID, use GET /Details/AccountDetails.
      # 
      # @param card_account_id [String] The card accountID
      # @param amount [Float] The amount to add. Negative values will remove funds.
      # @param text [String] The note text.
      #
      # @returns 200 {
      #   "AccountId": 0,
      #   "AvailableBalance": 0,
      #   "LedgerBalance": 0,
      #   "TransactionId": 0
      # }
      #
      # @returns 403 { description: 'Invalid card account ID' }
      # @returns 403 { description: 'Must be card account ID' }
      # @returns 403 { description: 'Insufficient funds on business' }
      # @returns 403 { description: 'Insufficient funds on card account' }
      # @returns 403 { description: 'Card available balance will exceed card limit' }
      # @returns 403 { description: 'Use Business Balance is enabled for card account' }
      # @returns 403 { description: 'Invalid amount' }
      def self.call(card_account_id='', amount=0, text="")
        _path = "Card/Fund/#{card_account_id}"

        _params = { Amount: amount }
        _params[:NoteText] = text if text.present? && !text.empty?
        
        ::PexApi::Client::Token.new.post(_path, _params)
      end
    end
  end
end

