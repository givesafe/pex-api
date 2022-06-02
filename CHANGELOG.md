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
