require 'pex_api/client/token'

module PexApi
  module Token
    class Delete
      # Delete a token
      #
      # Returns BOOL indicating the deletion was successful or not
      def self.call(token=nil)
        response = ::PexApi::Client::Token.new(token: token).delete('Token')
        
        response.code.to_s[0].to_i <= 2
      end
    end
  end
end

