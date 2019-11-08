module Calculator
  class Processor
    attr_reader :params

    def initialize(params)
      raise ArgumentError, "missing parameter :amount" unless params[:amount]

      @params = params
    end

    def call

      [context[:net_amount], context[:commission_total]]
    end

    private

    def context
      @context ||= { amount: amount, rates: rates }
    end

    def amount
      params[:amount].to_d.round(2)
    end

    def rates
      @rates ||= RatesResolver.call(params)
    end

  end
end
