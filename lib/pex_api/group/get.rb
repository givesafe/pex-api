require 'pex_api/client/token'

module PexApi
  module Group
    class Get
      # get a list of Groups or a specific Group's details 
      #
      # Returns http response
      def self.call(group_id=nil)
        _path = "Group"
        _path = "#{_path}/#{group_id}" if group_id.present?

        ::PexApi::Client::Token.new.get(_path)
      end
    end
  end
end

