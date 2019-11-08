# frozen_string_literal: true

module Calculator
  module Computations
    CHAIN = [
      CommissionTotal,
      NetAmount
    ].freeze

    def self.call!(context)
      CHAIN.each do |computation|
        computation.call!(context)
      end

      context
    end
  end
end
