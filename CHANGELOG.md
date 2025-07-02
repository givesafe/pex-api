## [Unreleased]

## [0.1.0] - 2022-05-20

- Initial release

## [0.2.0] - 2022-05-20

- PexApi.configuration now initializes with defaults that use ENV variable. See lib/pex_api/configuration.rb.initialize
- Renamed PexApi.configuration.token to PexApi.confuguration.app_token

## [0.2.1] - 2022-05-20

- Fixing require error '/token/get (LoadError)'

## [0.2.2] - 2022-05-20

- PexApi.confuguration.app_token not set automatically anymore, set when PexApi::Client::Token is used

## [0.2.3] - 2022-05-20

- Fixed bug where PexApi::Client::Token.new.token was not setting token attribute on initialization when PexApi::Token::Get.call is used in the initializer.
- PexApi::Token::Delete.call `token` attribute is now optional and will default to PexApi.configuration.app_token

## [0.2.4] - 2022-05-20

- Require all relevant classes in main pex_api.rb file

## [0.2.5] - 2022-06-02

- PexApi::Token::Delete.call with no parameter will unset PexApi.configuration.app_token
- PexApi::Details::AccountDetails.call card_account_id parameter is no optional. 

## [0.2.6] - 2022-06-02

- All classes return http responses directly except for PexApi::Token::Get, that still returns a token or empty string

## [0.2.7]  
requiring all pex files in glob
Adding debug comments to
requiring full paths from 0.2.7.3
Using require_relative
individually requiring each file and adding a commented ex of how to get the individual files

## [0.2.8]
Fixing Card::CardOrder and Group::Get to use GET instead of POST.

## [0.2.9]
PexApi::Card::CardOrder error with start_date and end_date fixed

## [0.2.10] 
Card::CardOrder and Datails::TransactionDetails date params bug fixed

## [0.2.11] 
Adding Group::New, updating Token::Get to return PexApi.configuration.app_token if present

## [v0.2.12] 
Adding Business::Balance

## [0.2.12.1]
fixing bug where i was calling rails method accidentally.

## [0.2.13]
fixing webhook/auth_token to use the decoded secret for comparison

## [0.2.14]
fixing Card::CardOrder and Group::Get fallback functionality for when id is an empty string

## [0.2.15]
- Fixing NoMethodError in webhook/auth_token usage of Base64. We were calling `Base64.base64_decode` which is the wrong api for `Base64`. It is supposed to be `Base64.decode64`
- Adding Documentation to Client/Token
- Setting Sandbox/Live mode based on ENV[PEX_API_MODE]
- Fixing Group/New. it was calling PexApi::Client::Token.new.post with wrong argument structure
- Fixing Card/ZeroBalance. The class was not named ZeroBalance...
- Updating README.md
- Updating CHANGELOG.md

## [0.2.16]
- updating client token to remove \n from base64 encoding and refactor for client base and configuration

## [0.2.17]
- Fixing PexApi::Card::Activate, was using wrong pex api url
- Updating CHANGELOG.md for v0.2.16 & v0.2.17

## [0.2.18]
- Fixing PexApi::Card::ZeroBalance, don't default to all accounts

## [0.2.19]
- Removing params from delete http requests

## [0.2.20]
- Fixing PexApi::Token::Get, we are getting errors like `error: Api::V3::PexFundController pex fund did not complete for member_id: 1967. withdrawal receipt destroyed and error returned: Token expired or does not exist`
- Ensuring that the cached app_token saved the expiration and will reset if it's expiring.

## [0.2.21]
- Adding more documentation and notes to classes. 
- Pex fund can send 0 amount
- Pex http responses are logged to console

## [0.2.22]
- Logging can be disabled by setting PEX_API_LOGGER_ENABLED to 'false', defaults to true

## [0.2.24]
- Fixing bug in Token::Get and Client::Token, there was a loop caused when deleting expired tokens. 

## [0.3.0]
- Update Transaction Details to work correctly. 

## [0.3.1]
- Fixing Authorization after PEX Update 2024.4.5.1 

## [0.3.2]
- Fixing bug in PexApi::Client::Token. It was creating a new token and using the new token even when config.app_token was set. Now it will use config.app_token when present and not create a new token or update config.app_token.

## [0.3.3]
- Updating rexml dependency for security purposes

## [0.4.0]
- Updating ruby dependency to 3.2+
- Updating rexml dependency for security purposes

## [0.4.1]
- Removing rexml dependency... was only set to attempt to force incorrectly.

## [0.4.2]
- fixing Gemfile and moving gems into the gemspec's development dependencies

## [0.4.3]
- Updating ruby version to 3.3.8
- Updating rexml dependency for security purposes