# Calculator

<img src="https://travis-ci.com/isidzukuri/calculator.svg?branch=master" alt="Build Status" />


Computes commission by amount and rates. Gem converts input values to `BigDecimal` for precise calculation.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'calculator', source: 'https://github.com/isidzukuri/calculator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install calculator

## Usage

Input:
 - amount *required
 - commission_amount *optional
 - commission_percent *optinal
 - commission_entity(user, product) *optional


 Output:

  [netto_amount, commission_amount]

Example:

```ruby
Calculator.call(amount: 100, commission_amount: 1.0, commission_percent: 20)
 # => [79.0, 21.0]
```

If commission rates not given it fallback to default values.

It computes commission with precision 2 digits after floating point.


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/isidzukuri/calculator.
