# PexApi

This gem is an API wrapper for (Pex Cards API)[https://developer.pexcard.com/docs4].

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pex_api'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install pex_api

## Usage

All endpoints are available within the PexApi module. 

This gem's paths follow the API's path structure with the exception of this gem's naming convention which is downcased.
The Pex Card API uses paths like `POST /Card/Activate/:id` and `PUT /Card/SetPin/:id`. 
This gem uses those paths with `PexApi::Card::Activate.call(:id)` and `PexApi::Card::SetPin.call(:id)`

Each class in this gem is an individual endpoint in the Pex Card API. 

There is a https helper class that is plugged into the PexApi::Client classes. 
These 2 classes, Basic and Token, are used as a individual methods that handle configuring the http request to the Pex Card API so that request automatically try to authenticate.

Each class/method will have it's own parameters depending on the type of request and it's expected input parameters.

### Setup

Add the following environment variables. The specific values can be found at https://developer.pexcard.com.

```
  PEX_API_AUTH_BASE64=
  PEX_API_USERNAME=
  PEX_API_PASSWORD=
  PEX_API_AUTH_BASE64=
```

If you do not use `PEX_API_AUTH_BASE64`, then you do have to use `PEX_API_APP_ID` and `PEX_API_APP_SECRET`.

### Sandbox/Live Mode

Pex provides a sandbox mode.
PexApi gem **defaults to sandbox mode**.

Add `PEX_API_MODE=live` environment variable if you want to use Pex's live server.



## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/givesafe/pex_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/givesafe/pex_api/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the PexApi project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/givesafe/pex_api/blob/master/CODE_OF_CONDUCT.md).
