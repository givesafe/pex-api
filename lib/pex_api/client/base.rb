require 'rest-client'
require 'json'
require 'pex_api/client/response'

module PexApi
  module Client
    class Base
      METHODS = [:get, :post, :put, :delete].freeze
      TYPES = [:basic, :token].freeze
      SANDBOX_API_URL = 'https://sandbox-coreapi.pexcard.com/v4'.freeze
      API_URL = 'https://coreapi.pexcard.com/v4'.freeze
      DEFAULT_HEADERS = {
        :Accept => 'application/json',
        :'Content-Type' => 'application/json'
      }.freeze

      attr_reader :url
      
      def initialize(sandbox_mode: true)
        @url = sandbox_mode ? SANDBOX_API_URL : API_URL
        
        raise InheritableOnlyClassTryingToInitializeError, "cannot initialize class: #{self.class}. Use Basic or Token"
      end

      define_method(:get) do |path, headers={}|
        _path = build_path path
        _headers = build_headers headers
        call(_method: :get, path: path, headers: headers)
      end
      
      METHODS.each do |_method|
        next if _method == :get
        define_method(_method) do |path, params={}, headers={}|
          call(_method: _method, path: path, params: params, headers: headers)
        end
      end

      private
      
      def build_path(path='')
        return url if path.empty?

        url + "/" + path
      end

      def build_headers(new_headers={})
        DEFAULT_HEADERS.merge(inherited_headers).merge(new_headers)
      end

      # this is blank on the base class and is inteded as an easy way to extend headers in inherited classes
      def inherited_headers
        {} 
      end

      def build_params(new_params={})
        new_params.to_json
      end

      def call(_method: nil, path: nil, params: {}, headers: {})
        _path = build_path path
        _params = build_params params
        _headers = build_headers headers
        
        begin
          puts "method: #{_method}"
          puts "path: #{_path}"
          puts "params: #{_params}"
          puts "headers: #{_headers}"
          args = [_path]
          args.push(_params) if [:post, :put, :delete].include?(_method)
          args.push(_headers)

          RestClient.send(_method, *args)
        rescue RestClient::Unauthorized => e
          puts "ERROR: #{e.response}"
          ::PexApi::Client::Response.new(400, 'Unauthorized')
        rescue RestClient::ServiceUnavailable => e
          puts "ERROR: #{e.response}"
          ::PexApi::Client::Response.new(400, 'ServiceUnavailable')
        end
      end
    end
  end
end
