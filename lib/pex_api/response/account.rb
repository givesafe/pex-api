module PexApi
  module Response
    class Address
      attr_reader :code, :status, :account_id, :available_balance, :ledger_balance, :transaction_id
      def initialize(code, rest={})
        @status = @code = code
        
        @account_id = rest.fetch("AccountId", 0),
        @available_balance = rest.fetch("AvailableBalance", 0),
        @ledger_balance = rest.fetch("LedgerBalance", 0),
        @transaction_id = rest.fetch("TransactionId", 0)
      end
    end
  end
end

