# frozen_string_literal: true

module Calculator
  module Computations
    class NetAmount < Base
      def call!
        context[:net_amount] = context[:amount] - context[:commission_total]
      end
    end
  end
end
