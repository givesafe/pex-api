require 'rest-client'

module PexApi
  class Https

    def self.call(_method, *args)
      RestClient.send(_method, *args)
    rescue RestClient::ExceptionWithResponse => e
      e.response
    rescue RestClient::Unauthorized => e
      puts "ERROR: #{e.response}"
      respond_with(400, e.response.body)
    rescue RestClient::ServiceUnavailable => e
      puts "ERROR: #{e.response}"
      respond_with(400, e.response.body)
    end

    def self.respond_with(code, body)
      error_struct = Struct.new(:code, :body)
      error_struct.new(code, body)
    end
  end
end
