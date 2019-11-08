# frozen_string_literal: true

require 'bigdecimal/util'

require 'calculator/computations/base'
require 'calculator/computations/commission_total'
require 'calculator/computations/net_amount'
require 'calculator/computations'
require 'calculator/processor'
require 'calculator/rates_resolver'
require 'calculator/version'

module Calculator
  def self.call(params)
    Processor.new(params).call
  end
end
