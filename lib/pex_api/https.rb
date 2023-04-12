require 'rest-client'
require 'pex_api/logger'

module PexApi
  class Https

    def self.call(_method, *args)
      RestClient.send(_method, *args)
    rescue RestClient::ExceptionWithResponse => e
      ::PexApi::Logger.log "ERROR: #{e}"
      e.response
    rescue RestClient::Unauthorized => e
      ::PexApi::Logger.log "ERROR: #{e.response}"
      respond_with(400, e.response.body)
    rescue RestClient::ServiceUnavailable => e
      ::PexApi::Logger.log "ERROR: #{e.response}"
      respond_with(400, e.response.body)
    end

    def self.respond_with(code, body)
      error_struct = Struct.new(:code, :body)
      error_struct.new(code, body)
    end
  end
end
