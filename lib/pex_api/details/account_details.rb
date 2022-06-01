require 'pex_api/client/token'

module PexApi
  module Details
    class AccountDetails
      # AccountDetails for an account
      #
      # Returns JSON response
      def self.call(token, card_account_id)
        _path = "Details/AccountDetails/#{card_account_id}"
        
        response = ::PexApi::Client::Token.new(token: token).get(_path)
        
        JSON.parse(response.body)
      end
    end
  end
end

