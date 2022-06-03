require 'pex_api/client/token'

module PexApi
  module Card
    class CardOrder
      # Get general information about card orders
      #
      # Returns http response
      def self.call(*args)
        _params = {
          StartDate: args.fetch(:start_date, DateTime.now.prev_month.to_s),
          EndDate: args.fetch(:end_date, DateTime.now.to_s)
        }

        ::PexApi::Client::Token.new.get("Card/CardOrder", _params)
      end
    end
  end
end

