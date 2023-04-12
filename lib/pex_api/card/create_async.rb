require 'pex_api/client/token'

module PexApi
  module Card
    class CreateAsync
      ##
      # Create cards for the business. The response to this call is a CardOrderId.
      # To retrieve card details, including the card AccountId, use GET /Card/CardOrder/{Id}
      #
      # NOTE: - Cards have an expiration date of 3 years and will renew automatically 60 days prior to expiration. If the card expiration is 01/17, the card will expire on the last day of the month, January 31, 2017.
      #       - non-ASCII characters. Ex: "ñ" not allowed
      #
      #       - If PEX card is used for fuel authorizations, transit passes or online purchases, there will be times where the cardholder will have to key in the billing zip code as it appears on the cardholder profile. To avoid issues at the time of purchase, let the cardholder know what their billing (i.e. profile) address is.
      #       - If the cardholder enters an invalid Zip Code 2 times, the merchant may refuse to accept additional card swipes. If this occurs, cardholders will have to see the attendant to complete a gas transaction, or use another form of payment.
      #       - If the cardholder should have access to dashboard.pexcard.com to review their transaction history, etc., they will need the four (4) digit year of birth from their profile. If you are using a generic value, you will need to convey that to the cardholder.
      #
      # SPENDING LIMITS:
      #   To add spend rules to a card account, use GET /SpendingRuleset to retrieve all the Spend rule sets for your business. 
      #   At card creation, the spend rule defaults are:
      #     - Daily spend limit is NONE
      #     - International spending is OFF
      #     - Card-not-present spending is ON
      #     - All merchant categories are ON.
      #
      # GROUPS:
      #   To add a card account to a group, use GET /Group to retrieve GroupIds 
      #
      # @params cards: Card[]
      #   Card<attrs|defaults> {
      #     phone: STR | "",                                # format: 2125551212 or 212-555-1212
      #     shipping_phone: STR | "",                       # format: 2125551212 or 212-555-1212
      #     shipping_method: STR | "Invalid",               # ShippingMethod is a required field and maps to the same choices available on the admin website:
      #                                                       ShippingMethod = 0 i.e 'FirstClassMail' (10-15 business days) Free
      #                                                       ShippingMethod = 1 i.e 'Expedited' (up to 4 business days) $35
      #                                                       ShippingMethod = 2 i.e 'Rush' (up to 3 business days) $45.
      #                                                       ShippingMethod = 3 i.e 'PriorityMail' (3-5 business days) $10.
      #     date_of_birth: STR | "",                        # format: MM-DD-YYYY
      #     email: STR | "",                                # format: name@domain.com
      #     group_id: INT | 0,
      #     ruleset_id: INT | 0,
      #     is_virtual_card: BOOL | false,
      #     custom_id: STR | "",                            # User defined Id which can be assigned to Card holder profile (alphanumeric up to 50 characters). This is optional field. 
      #     first_name: STR | "",                           # Cardholder name may only include letters, numbers and the following punctuation symbols: , . - & '
      #     last_name: STR | "",                            # Cardholder first + last names must be no more than 23 characters
      #     has_normalized_profile_address: BOOL | false,
      #     profile_address: Address,
      #     has_normalized_shipping_address: BOOL | false,
      #     shipping_address: Address,                      # Shipping address is used for card mailing. PEX uses this address for all future card replacements including: lost, stolen, compromised and renewal.
      #                                                     # Valid Shipping address need to be populated as part of request while creating new cards.
      #   }
      #
      #   Address<attrs|defaults> {
      #     address_line_1: STR | "",                       # format: letters, numbers and the following punctuation symbols: . ' () , # - /
      #                                                     # Max field length: 26 characters
      #     address_line_2: STR | "",                       # format: letters, numbers and the following punctuation symbols: . ' () , # - /
      #                                                     # Max field length: 26 characters
      #     city: STR | "",                                 # Max City field length: 25 characters
      #     state: STR | "",                                # two letter format ex. "CA" 
      #     postal_code: STR | "",                          # Zipcode must be 5 digits. format: 10018     
      #     country: STR | ""
      #   }
      #
      #   ShippingAddress<attrs|defaults> < Address {
      #     contact_name: STR | ""
      #   }
      #
      # @returns 201 {
      #   "CardOrderId": 0
      # } 
      # @returns 400 { description: 'Invalid shipping method' }
      # @returns 403 { description: 'Admin does not have permission' }
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
