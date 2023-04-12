module PexApi
  class Logger
    def self.log(message)
      return if is_disabled?
      
      puts message
    end

    private

    def self.is_disabled?
      ENV.fetch('PEX_API_LOGGER_ENABLED', 'true') == 'false'
    end
  end
end