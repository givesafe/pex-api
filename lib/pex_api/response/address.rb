module PexApi
  module Response
    class Address
      attr_reader :code, :status, :address_ine_1, :address_ine_2, :city, :state, :postal_code, :country
      def initialize(code, rest={})
        @status = @code = code
        
        @address_ine_1 = rest.fetch("AddressLine1",""),
        @address_ine_2 = rest.fetch("AddressLine2",""),
        @city = rest.fetch("City",""),
        @state = rest.fetch("State",""),
        @postal_code = rest.fetch("PostalCode",""),
        @country = rest.fetch("Country","")
      end
    end
  end
end
