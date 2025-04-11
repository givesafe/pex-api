# frozen_string_literal: true

require_relative "lib/pex_api/version"

Gem::Specification.new do |spec|
  spec.name          = "pex_api"
  spec.version       = PexApi::VERSION
  spec.authors       = ["Danny Sperry"]
  spec.email         = ["danny.sperry@gmail.com"]

  spec.summary       = "PEX SDK for Ruby"
  spec.description   = "The official SDK for the PEX API, containing interface implementations and error handling for working with it."
  spec.homepage      = "https://developer.pexcard.com"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 3.2.4"

  spec.metadata["allowed_push_host"] = ""

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/givesafe/pex-api"
  spec.metadata["changelog_uri"] = "https://github.com/givesafe/pex-api/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "rest-client", "~> 2.1.0"
  
  spec.add_development_dependency 'dotenv', '~> 2.5'
  spec.add_development_dependency 'rake', '~> 13.0'

  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 1.7'
  spec.add_development_dependency 'vcr', '~> 6.1'
  spec.add_development_dependency 'webmock', '~> 3.18.1'
  spec.add_development_dependency 'rest-client', '~> 2.1.0'

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
