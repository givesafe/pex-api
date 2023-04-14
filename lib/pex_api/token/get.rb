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
        
        token = ''

        # try to get an existing valid token
        if response.code.to_s[0].to_i == 2
          tokens = JSON.parse(response.body)['Tokens']
          token = get_oldest_expiry_token(tokens)
        else
          ::PexApi::Logger.log "PexApi Error: ::PexApi::Client::Basic.new.get('Token') returned #{response.code} with a response body: #{response.body}"
        end
        
        # if we don't have a valid token then we create a new one
        if token.nil? or token.empty?
          response = ::PexApi::Token::New.call

          if response.code.to_s[0].to_i == 2
            token = JSON.parse(response.body)['Token']
          else
            token = ''
            ::PexApi::Logger.log "PexApi Error: ::PexApi::Token::New.call returned #{response.code} with a response body: #{response.body}"
          end
        end
        
        token
      end

      private


      # Look through the list of tokens and delete the expired and will expire in the next month tokens.
      # Then sort the tokens by expiration date and get the token that will expire latest, delete the rest of the tokens
      # If all tokens were expired or no tokens were returned, then create a new token.
      #       
      # Returns: STRING <Token | "">
      def self.get_oldest_expiry_token(json_tokens)
        # json_tokens response ex: [{"Username"=>"user1", "AppId"=>"app1", "Token"=>"token_hash", "TokenExpiration"=>"2023-09-20T16:47:39.68"}] 
        _valids = []
        _deletables = []
        if json_tokens.length > 0
          # iterate through the tokens
          json_tokens.each do |token|
            # check if date_string formatted like `2022-11-24T17:12:41.507` will expire in the next month
            is_expired = DateTime.parse(token['TokenExpiration']) < DateTime.now.next_month
            # group them by (expired/will expire soon) or valid
            if is_expired
              _deletables << token
            else
              _valids << token
            end
          end
        end
        valids = sort_list(_valids)
        # pop the oldest expiring token out of the list
        valid = valids.pop
        # delete the rest of the tokens
        _deletables = _deletables + valids
        # return empty string if valid is nil
        delete_list(_deletables, valid)
        
        ::PexApi.configuration.app_token = valid
      end

      def self.delete_list(_tokens, valid_token)
        return _tokens if _tokens.length == 0
        
        _tokens.each { |_t| delete(_t) } 
      end

      def self.sort_list(_tokens)
        return _tokens if _tokens.length == 0

        _tokens.sort_by! { |t| DateTime.parse(t['TokenExpiration']) }
      end

      def self.delete(token)
        response = ::PexApi::Token::Delete.call(token)
        
        ::PexApi::Logger.log "PexApi Error: ::PexApi::Token::Delete.call returned #{response.code} with a response body: #{response.body}"
        
        response
      end
    end
  end
end

