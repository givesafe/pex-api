require 'pex_api/client/token'

module PexApi
  module Card
    class CardOrder
      # Get general information about card orders
      #
      # Returns http response
      def self.call(id=nil, start_date: DateTime.now.prev_month.to_s, end_date: DateTime.now.to_s)
        id = nil if id.respond_to?(:empty?) and id.empty?
        _path = "Card/CardOrder"
        if id.nil?
          _path = "#{_path}?StartDate=#{start_date}&EndDate=#{end_date}"
        else
          _path = "#{_path}/#{id}" 
        end
        
        ::PexApi::Client::Token.new.get(_path)
      end
    end
  end
end

