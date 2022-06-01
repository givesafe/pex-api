require 'pex_api/client/token'

module PexApi
  class Group
    # Group a card
    #
    # Returns BOOL indicating the activation was successful or not
    def self.call(token)
      ::PexApi::Client::Token.new(token: token).post("Group")
    end
  end
end

