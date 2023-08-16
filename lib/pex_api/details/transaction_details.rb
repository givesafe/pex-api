require 'pex_api/client/token'

module PexApi
  module Details
    class TransactionDetails
      # TransactionHistory for an account
      #
      # Returns http response
      #
      # THIS IS PROBABLY NOT NECESSARY AND SHOULD JUST BE MANAGED BY THE BACKEND TRANSACTION HISTORY.
      # IF CHARGES OCCUR ON THIS CARD THAT DONT OCCUR ON THE BACKEND THEN THIS SHOULD BE USED IN A BACKEND CRON JOB TO UPDATE TRANSACTION HISTORY
      def self.call(card_account_id, **args)
        _path = "Details/TransactionDetails/#{card_account_id}"

        _params = {
          "StartDate" => args.fetch(:start_date, DateTime.now.prev_month.to_s),
          "EndDate" => args.fetch(:end_date, DateTime.now.to_s),
          "IncludePendings" => args.fetch(:include_pendings, false),
          "IncludeDeclines" => args.fetch(:include_declines, false)
        }

        ::PexApi::Client::Token.new.get(_path, params: _params)
      end
    end
  end
end
