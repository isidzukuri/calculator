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
 - commission_percent *optional
 - commission_entity(user, product) *optional


 Output:

  [netto_amount, commission_amount]

Example:

```ruby
Calculator.call(amount: 100)
 # => [100.0, 0.0]

Calculator.call(amount: 100, commission_amount: 1.0, commission_percent: 20.333)
 # => [78.67, 21.33]
```

If commission rates are not given it fallback to default values.

It computes commission with precision 2 digits after floating point.

Example with commission_entity:
```ruby
class Product
  def commission_amount
    0.2
  end
end

Calculator.call(amount: 100, commission_entity: Product.new)
# => [99.8, 0.2]
```

If rates and commission_entity are given than values from commission_entity will be used:
```ruby
Calculator.call(
  amount: 100,
  commission_amount: 1.0,
  commission_percent: 5,
  commission_entity: Product.new)
# => [94.8, 5.2]
```


## How it works
To simplify reading and understanding of complex calculation is useful to split it in small parts. Each is responsible for one operation, which is easier to test, modify, reuse and document.

Gem uses chain of computations(`Calculator::Computations::CHAIN`). It calls each computation in specified order.
Each updates context of calculator. In this way results of previous computations are accessible for all following operations.

Its easy to plug in new computations. For example: other commission, discounts, delivery price, fees, vats, bonuses, and so on and so forth...

To add new computation you need to write computation class with implemented `:call!` method and add it to `Calculator::Computations::CHAIN`.    

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/isidzukuri/calculator.
