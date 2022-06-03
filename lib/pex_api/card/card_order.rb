require 'pex_api/client/token'

module PexApi
  module Card
    class CardOrder
      # Get general information about card orders
      #
      # Returns http response
      def self.call(id=nil, start_date: DateTime.now.prev_month.to_s, end_date: DateTime.now.to_s)
        _path = "Card/CardOrder"
        _path = "#{_path}/#{id}" unless id.nil?
        _path = "#{_path}?StartDate=#{start_date}&EndDate=#{end_date}"
        
        ::PexApi::Client::Token.new.get(_path)
      end
    end
  end
end

