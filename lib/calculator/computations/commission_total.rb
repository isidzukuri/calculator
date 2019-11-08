# frozen_string_literal: true

module Calculator
  module Computations
    class CommissionTotal < Base
      def call!
        context[:commission_total] = (context[:amount] * commission_percent + commission_amount).round(2)
      end

      private

      def commission_percent
        context[:rates][:commission_percent] / 100.to_d
      end

      def commission_amount
        context[:rates][:commission_amount]
      end
    end
  end
end
