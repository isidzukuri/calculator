module Calculator
  module Computations

    CHAIN = [
      CommissionTotal,
      NetAmount
    ]

    def self.call!(context)
      CHAIN.each do |computation|
        computation.call!(context)
      end

      context
    end

  end
end
