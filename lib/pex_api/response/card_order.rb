module PexApi
  module Response
    class CardOrder
      attr_reader :code, :status, :username, :card_order_id, :order_date_time, :business_admin_id, :business_account_id, :number_of_cards
      def initialize(code, rest={})
        @status = @code = code
        
        @username = rest.fetch('Username', '')
        @card_order_id = rest.fetch('CardOrderId', 0)
        order_date_time = rest.fetch('OrderDateTime', '')
        @order_date_time = DateTime.strptime(order_date_time) unless order_date_time.empty?
        @business_admin_id = rest.fetch('BusinessAdminId', 0)
        @business_account_id = rest.fetch('BusinessAccountId', 0)
        @number_of_cards = rest.fetch('NumberOfCards', 0)
      end
    end
  end
end
