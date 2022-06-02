# frozen_string_literal: true

Dir[File.join(__dir__, 'lib', 'pex_api', '**', '*.rb')].each { |file| puts file[6..-4] }

module PexApi
  class Error < StandardError; end
  class InheritableOnlyClassTryingToInitializeError < StandardError; end
  class MissingRequiredArgumentError < ArgumentError; end
  class MissingRequiredConfig < StandardError; end
  # Your code goes here...

  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end
  end
end
