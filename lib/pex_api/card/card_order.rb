require 'pex_api/client/token'

module PexApi
  module Card
    class CardOrder
      ##
      # Get general information about Card Orders
      #
      # This returns all the card order Ids those were created in the duration specified by start_date and end_date. 
      # With the CardOrderId from response you can use GET/Card/CardOrder/{Id} to get more information about the cards created within that CardOrder. 
      #
      # NOTE: This method ensures that the start time and end time are within not more than a year apart by moving start time up to one year before the end time.
      # 
      # @param id [String] The ID of the order.
      # @param start_date [String] The start date of the time frame. (format - YYYY-MM-DDThh:mm:ss
      # @param end_date [String] The end date of the time frame. (format - YYYY-MM-DDThh:mm:ss
      #
      # @returns 200 {
      #   "CardOrders": [
      #     {
      #       "CardOrderId": 0,       # Order ID returned as a response to POST/Card/CreateAsync, when you submit card creation request. 
      #       "OrderDateTime": "",    # Date time when the card order was placed.
      #       "UserName": "",         # Username of the user who placed the order
      #       "BusinessAdminId": 0,   # Unique identifier for the business admin who placed the card order. More information about admin can be obtained by GET/Business/Admin/{Id}. It can have null value in some cases. 
      #       "BusinessAccountId": 0, # Account Id to which card order belongs to. 
      #       "NumberOfCards": 0      # Total count of number of cards successfully created in the card order. 
      #     }
      #   ]
      # }
      #
      # when @param id is present
      # @returns 200 {
      #   {
      #     "CardOrderId": 0,
      #     "OrderDateTime": "",
      #     "UserName": "",
      #     "BusinessAccountId": 0,
      #     "Cards": [
      #       {
      #         "AcctId": 0,
      #         "Status": "",
      #         "FirstName": "",
      #         "MiddleName": "",
      #         "LastName": "",
      #         "DateOfBirth": "",
      #         "HomePhone": "",
      #         "MobilePhone": "",
      #         "Email": "",
      #         "HomeAddress": {
      #           "AddressLine1": "",
      #           "AddressLine2": "",
      #           "City": "",
      #           "State": "",
      #           "PostalCode": "",
      #           "Country": ""
      #         },
      #         "ShippingAddress": {
      #           "AddressLine1": "",
      #           "AddressLine2": "",
      #           "City": "",
      #           "State": "",
      #           "PostalCode": "",
      #           "Country": ""
      #         },
      #         "Recipient": "",
      #         "ShipToShippingAddress": false,
      #         "ShippingContactNumber": "",
      #         "BundleCards": false,
      #         "ShippingMethod": "",
      #         "ShippingDate": "",
      #         "Errors": [
      #           {
      #             "Code": "",
      #             "Message": ""
      #           }
      #         ],
      #         "FailReason": "",
      #         "AccountNumber": "",
      #         "SpendingRulesetId": 0,
      #         "GroupId": 0,
      #         "CustomId": "",
      #         "IsVirtual": false
      #       }
      #     ]
      #   }
      # }
      # 
      #
      def self.call(id=nil, start_date: DateTime.now.prev_month, end_date: DateTime.now)
        id = nil if id.respond_to?(:empty?) and id.empty?
        _path = "Card/CardOrder"
        
        # if no id is passed, get all the card orders within the time frame
        if id.nil?
          # if the time frame is larger than a year, move the start timeframe forward to one year before the end time.
          year_before_end_date = end_date.year - 1
          if start_date < year_before_end_date
            start_date = end_date - 1.year
          end

          _path = "#{_path}?StartDate=#{start_date}&EndDate=#{end_date}"
        else
          _path = "#{_path}/#{id}" 
        end
        
        ::PexApi::Client::Token.new.get(_path)
      end
    end
  end
end

