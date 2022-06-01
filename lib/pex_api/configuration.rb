# lib/pex_api/configuration.rb
require 'base64'

module PexApi
  class Configuration
    attr_accessor :app_id, :app_secret, :username, :password, :app_base64_auth

    def initialize
      @app_id = ENV['APP_ID'] || nil
      @app_secret = ENV['APP_SECRET'] || nil
      @username = ENV['API_USERNAME'] || nil
      @password = ENV['API_PASSWORD'] || nil
      
      @app_base64_auth = ENV['API_AUTH_BASE64'] || nil
      if @app_base64_auth.nil? && !@app_id.nil? && !@app_secret.nil?
        @app_base64_auth = Base64.encode64(@app_id + ':' + @app_secret)[0..-1]
      end
    end
  end
end
