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
