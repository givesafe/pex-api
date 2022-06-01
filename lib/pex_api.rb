# frozen_string_literal: true

require_relative "pex_api/version"
require_relative "pex_api/configuration"

require_relative "pex_api/card/activate"
require_relative "pex_api/card/create_async"
require_relative "pex_api/card/fund"
require_relative "pex_api/card/set_pin"
require_relative "pex_api/card/terminate"
require_relative "pex_api/card/zero_balance"

require_relative "pex_api/details/account_details"
require_relative "pex_api/details/transaction_details"

require_relative "pex_api/webhook/auth_token"

require_relative "pex_api/client/token"
require_relative "pex_api/client/basic"

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
