require 'pex_api/client/token'

module PexApi
  module Group
    class New
      # Create a Group
      #
      # Returns http response
      def self.call(group_name="")

        _path = "Group"

        ::PexApi::Client::Token.new.post(_path, { Name: group_name })
      end
    end
  end
end

