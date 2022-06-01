require 'pex_api/response/address'
require 'pex_api/response/error'

module PexApi
  module Response
    class Card
      attr_reader :code, :status, :account_id, :status, :first_name, :middle_name, :last_name, :date_of_birth, :home_phone, :mobile_phone, :email, :recipient, :ship_to_shipping_address,
                  :shipping_contact_number, :bundle_cards, :shipping_method, :shipping_date, :fail_reason, :account_number, :spending_ruleset_id, :group_id, :custom_id, :is_virtual,
                  :home_address, :shipping_address, :errors
      def initialize(code, rest={})
        @status = @code = code
        
        @username = rest.fetch('Username', '')
        @account_id = rest.fetch("AcctId", 0)
        @status = rest.fetch("Status", ""),
        @first_name = rest.fetch("FirstName", ""),
        @middle_name = rest.fetch("MiddleName", ""),
        @last_name = rest.fetch("LastName", ""),
        @date_of_birth = rest.fetch("DateOfBirth", ""),
        @home_phone = rest.fetch("HomePhone", ""),
        @mobile_phone = rest.fetch("MobilePhone", ""),
        @email = rest.fetch("Email", ""),
        @recipient = rest.fetch("Recipient", ""),
        @ship_to_shipping_address = rest.fetch("ShipToShippingAddress", false),
        @shipping_contact_number = rest.fetch("ShippingContactNumber", ""),
        @bundle_cards = rest.fetch("BundleCards", false),
        @shipping_method = rest.fetch("ShippingMethod", ""),
        @shipping_date = rest.fetch("ShippingDate", ""),
        @fail_reason = rest.fetch("FailReason", ""),
        @account_number = rest.fetch("AccountNumber", ""),
        @spending_ruleset_id = rest.fetch("SpendingRulesetId", 0),
        @group_id = rest.fetch("GroupId", 0),
        @custom_id = rest.fetch("CustomId", ""),
        @is_virtual = rest.fetch("IsVirtual", false)
        @home_address = ::PexApi::Response::Address.new(rest.fetch("HomeAddress", {}))
        @shipping_address = ::PexApi::Response::Address.new(rest.fetch("ShippingAddress", {}))
        @errors = rest.fetch('Errors', []).map do |_e|
          ::PexApi::Response::Error.new(_e)
        end
      end
    end
  end
end
