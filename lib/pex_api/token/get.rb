require 'pex_api/client/basic'
require 'pex_api/token/new'
require 'pex_api/token/delete'

module PexApi
  module Token
    class Get
      # Get a token
      #
      # This has multiple pieces of functionality and is intended to be used as a general way to get the most recent token.
      # Essentiall Delete and New are private and this is the only intended public class
      #
      # This cleans up the existing tokens so that we should only have one valid one at a time
      #
      # Returns STRING <Token | "">
      def self.call
        response = ::PexApi::Client::Basic.new.get('Token')
        
        if response.code.to_s[0].to_i > 2
          puts "PexApi Error: ::PexApi::Client::Basic.new.get('Token') returned #{response.code} with a response body: #{response.body}"
          return ""
        end
        
        _tokens = JSON.parse(response.body)['Tokens']
        _groups = clean_expired_tokens _tokens
        
        # take one of the valid token
        _token = _groups[:valids].pop
        # delete the expired/soon to expire tokens and the rest of the valids
        delete_list(_groups[:expired]) and delete_list(_groups[:valids])

        # get a new token if there were no valid tokens
        _token = ::PexApi::Token::New.call unless _token

        _token
      end

      private


      def self.clean_expired_tokens(json_tokens)
        _tokens = { expired: [], valids: [] }
        if json_tokens.length > 0
          # iterate through the tokens
          json_tokens.each do |token|
            # check if date_string formatted like `2022-11-24T17:12:41.507` will expire in the next month
            date, time = token['TokenExpiration'].split('T')
            expiry_array = ((date.split('-').map(&:to_i)) + (time.split(':').map(&:to_f)))
            is_expired = DateTime.new(*expiry_array) < DateTime.now.next_month
            # group them by expired or valid
            key = is_expired ? :expired : :valids
            _tokens[key] << token['Token']
          end
        end
        _tokens
      end

      def self.delete_list(_tokens)
        _tokens.each { |_t| delete(_t) } if _tokens.length > 0
      end

      def self.delete(token)
        ::PexApi::Token::Delete.call(token)
      end
    end
  end
end

