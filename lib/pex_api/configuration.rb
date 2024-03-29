# lib/pex_api/configuration.rb
require 'base64'

module PexApi
  class Configuration
    attr_reader :app_id, :app_secret, :username, :password, :app_base64_auth
    attr_accessor :app_token

    def initialize
      @app_id = ENV['PEX_API_APP_ID'] || nil
      @app_secret = ENV['PEX_API_APP_SECRET'] || nil
      @username = ENV['PEX_API_USERNAME'] || nil
      @password = ENV['PEX_API_PASSWORD'] || nil
      @app_token = ENV['PEX_API_APP_TOKEN'] || nil
      
      @app_base64_auth = ENV['PEX_API_AUTH_BASE64'] || nil
      if @app_base64_auth.nil? && !@app_id.nil? && !@app_secret.nil?
        base64 = Base64.encode64(@app_id + ':' + @app_secret) # => "someencodeddata\n"
        @app_base64_auth = base64[0..-2] # remove the \n from the end of the encoded string
      end
    end
  end
end
