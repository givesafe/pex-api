require 'pex_api/client/token'

module PexApi
  module Details
    class AccountDetails
      # AccountDetails for an account
      #
      # Returns JSON response
      def self.call(card_account_id=nil)
        _path = "Details/AccountDetails"
        _path = "#{_path}/#{card_account_id}" if card_account_id.present?
        
        response = ::PexApi::Client::Token.new.get(_path)
        
        JSON.parse(response.body)
      end
    end
  end
end

