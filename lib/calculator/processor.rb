# frozen_string_literal: true

module Calculator
  class Processor
    attr_reader :params

    def initialize(params)
      raise ArgumentError, 'missing parameter :amount' unless params[:amount]

      @params = params
    end

    def call
      Computations.call!(context)

      [context[:net_amount].to_f, context[:commission_total].to_f]
    end

    private

    def context
      @context ||= { amount: amount, rates: rates }
    end

    def amount
      params[:amount].to_d.round(2)
    end

    def rates
      @rates ||= RatesResolver.new(params).call
    end
  end
end
