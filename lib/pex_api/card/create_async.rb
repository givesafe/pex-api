require 'pex_api/client/token'

module PexApi
  module Card
    class CreateAsync
      # Create card(s)
      #
      # Returns RestClient::Response-like object that responds to `.code` and `.body`.
      #
      # @params cards: Card[]
      #   Card<attrs|defaults> {
      #     phone: STR | "",
      #     shipping_phone: STR | "",
      #     shipping_method: STR | "Invalid",
      #     date_of_birth: STR | "",
      #     email: STR | "",
      #     group_id: INT | 0,
      #     ruleset_id: INT | 0,
      #     is_virtual_card: BOOL | false,
      #     custom_id: STR | "",
      #     first_name: STR | "",
      #     last_name: STR | "",
      #     has_normalized_profile_address: BOOL | false,
      #     profile_address: Address,
      #     has_normalized_shipping_address: BOOL | false,
      #     shipping_address: Address,
      #   }
      #
      #   Address<attrs|defaults> {
      #     address_line_1: STR | "",
      #     address_line_2: STR | "",
      #     city: STR | "",
      #     state: STR | "",
      #     postal_code: STR | "",
      #     country: STR | ""
      #   }
      #
      #   ShippingAddress<attrs|defaults> < Address {
      #     contact_name: STR | ""
      #   }
      #
      # Returns http response
      def self.call(cards=[])
        formatted_cards = cards.map do |card|
          profile_address = card.fetch(:profile_address, {})
          shipping_address = card.fetch(:shipping_address, {})
          
          {
            "Phone": card[:phone] || "",
            "ShippingPhone": card[:shipping_phone] || "",
            "ShippingMethod": card[:shipping_method] || "Invalid",
            "DateOfBirth": card[:date_of_birth] || "",
            "Email": card[:email] || "",
            "GroupId": card[:group_id] || 0,
            "RulesetId": card[:ruleset_id] || 0,
            "VirtualCard": card[:is_virtual_card] || false,
            "CustomId": card[:custom_id] || "",
            "FirstName": card[:first_name] || "",
            "LastName": card[:last_name] || "",
            "NormalizeProfileAddress": card[:has_normalized_profile_address] || false,
            "ProfileAddress": {
              "AddressLine1": profile_address[:address_line_1] || "",
              "AddressLine2": profile_address[:address_line_2] || "",
              "City": profile_address[:city] || "",
              "State": profile_address[:state] || "",
              "PostalCode": profile_address[:postal_code] || "",
              "Country": profile_address[:country] || ""
            },
            "NormalizeShippingAddress": card[:has_normalize_shipping_address] || false,
            "ShippingAddress": {
              "ContactName": shipping_address[:contact_name] || "",
              "AddressLine1": shipping_address[:address_line_1] || "",
              "AddressLine2": shipping_address[:address_line_2] || "",
              "City": shipping_address[:city] || "",
              "State": shipping_address[:state] || "",
              "PostalCode": shipping_address[:postal_code] || "",
              "Country": shipping_address[:country] || ""
            }
          }
        end
        _params = { "Cards": formatted_cards }

        ::PexApi::Client::Token.new.post("Card/CreateAsync", _params)
      end
    end
  end
end
