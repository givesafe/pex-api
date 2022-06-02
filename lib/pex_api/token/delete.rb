require 'pex_api/client/token'

module PexApi
  module Token
    class Delete
      # Delete a token
      #
      # Returns http response
      def self.call(token=nil)
        ::PexApi::Client::Token.new(token: token).delete('Token')
      end
    end
  end
end

