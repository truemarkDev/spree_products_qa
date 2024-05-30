# Spree Products qa

This is a Products qa extension for [Spree Commerce](https://spreecommerce.org), an open source e-commerce platform built with Ruby on Rails.

## Installation

1. Add spree_products_qa to your Gemfile:

    ```ruby
    gem 'spree_products_qa', git: 'https://github.com/TruemarkDev/spree_products_qa.git', branch: 'master'
    ```

2. Copy & run migrations

    ```ruby
    bundle
    bundle exec rails g spree_products_qa:install
    ```

3. Restart your server

  If your server was running, restart it so that it can find the assets properly.

## Developing

1. Create a dummy app

    ```bash
    bundle update
    bundle exec rake test_app
    ```

2. Add your new code
3. Run tests

    ```bash
    bundle exec rspec
    ```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_products_qa/factories'
```

## Releasing a new version

```shell
bundle exec gem bump -p -t
bundle exec gem release
```

For more options please see [gem-release README](https://github.com/svenfuchs/gem-release)

## Contributing

If you'd like to contribute, please take a look at the
[instructions](CONTRIBUTING.md) for installing dependencies and crafting a good
pull request.

Copyright (c) 2014 [Netguru](https://netguru.co), released under the New BSD License.
