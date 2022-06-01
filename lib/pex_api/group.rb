require 'pex_api/client/token'

module PexApi
  class Group
    # Group a card
    #
    # Returns BOOL indicating the activation was successful or not
    def self.call
      ::PexApi::Client::Token.new.post("Group")
    end
  end
end

