module PexApi
  module Response
    class Token
      attr_reader :code, :status, :username, :app_id, :token, :token_expiration, :expiration_time, :seconds_till_expires, :seconds_till_expire
      def initialize(code, rest={})
        @status = @code = code
        
        @username = rest.fetch('Username', '')
        @app_id = rest.fetch('AppId', '')
        @token = rest.fetch('Token', '')
        @token_expiration = rest.fetch('TokenExpiration', '')

        @expiration_time = DateTime.strptime(rest.fetch('ExpirationTime', DateTime.now.to_s))
        @seconds_till_expire = @seconds_till_expires = rest.fetch('SecondsUntilExpire', 0)
      end
    end
  end
end
