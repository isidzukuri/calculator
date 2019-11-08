# frozen_string_literal: true
require 'bigdecimal/util'

require 'calculator/version'
require 'calculator/processor'
require 'calculator/rates_resolver'


module Calculator
  def self.call(params)
    Processor.new(params).call
  end
end
