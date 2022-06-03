# frozen_string_literal: true

# Dir[File.join(__dir__, 'lib', 'pex_api', '**', '*.rb')].each do |file|
#   puts "require_relative \"#{file[6..-4]}\""
# end

require_relative "pex_api/token/get"
require_relative "pex_api/token/new"
require_relative "pex_api/token/delete"
require_relative "pex_api/webhook/auth_token"
require_relative "pex_api/card/activate"
require_relative "pex_api/card/create_async"
require_relative "pex_api/card/terminate"
require_relative "pex_api/card/set_pin"
require_relative "pex_api/card/card_order"
require_relative "pex_api/card/zero_balance"
require_relative "pex_api/card/fund"
require_relative "pex_api/response/base"
require_relative "pex_api/response/account"
require_relative "pex_api/response/card"
require_relative "pex_api/response/card_order"
require_relative "pex_api/response/error"
require_relative "pex_api/response/token"
require_relative "pex_api/response/address"
require_relative "pex_api/group/get"
require_relative "pex_api/group/new"
require_relative "pex_api/business/balance"
require_relative "pex_api/details/account_details"
require_relative "pex_api/details/transaction_details"
require_relative "pex_api/version"
require_relative "pex_api/https"
require_relative "pex_api/configuration"
require_relative "pex_api/client/base"
require_relative "pex_api/client/basic"
require_relative "pex_api/client/token"

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
