# frozen_string_literal: true

require_relative "pex_api/version"

module PexApi
  module Auth; end
  class Error < StandardError; end
  class InheritableOnlyClassTryingToInitializeError < StandardError; end
  class MissingRequiredArgumentError < ArgumentError; end
  # Your code goes here...
end
