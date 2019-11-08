module Calculator
  class Processor
    attr_reader :params

    def initialize(params)
      raise ArgumentError, "missing parameter :amount" unless params[:amount]

      @params = params
    end

    private

    def context
      @context ||= { amount: amount, rates: rates }
    end

    def amount
      params[:amount].to_d.round(2)
    end

  end
end
