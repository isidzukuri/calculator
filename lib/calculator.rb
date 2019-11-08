# frozen_string_literal: true
require 'bigdecimal/util'

require 'calculator/version'
require 'calculator/processor'


module Calculator
  def self.call(params)
    Processor.new(params).call
  end
end
