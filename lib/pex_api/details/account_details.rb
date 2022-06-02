require 'pex_api/client/token'

module PexApi
  module Details
    class AccountDetails
      # AccountDetails for an account
      #
      # Returns http response
      def self.call(card_account_id=nil)
        _path = "Details/AccountDetails"
        _path = "#{_path}/#{card_account_id}" if card_account_id.present?
        
        ::PexApi::Client::Token.new.get(_path)
      end
    end
  end
end

