# frozen_string_literal: true

module Calculator
  class Context < OpenStruct
    attr_reader :params

    def initialize(params)
      @params = params

      validate

      super(initial_data)
    end

    private

    def validate
      raise ArgumentError, 'missing parameter :amount' unless params[:amount]
    end

    def initial_data
      { amount: amount, rates: rates }
    end

    def amount
      params[:amount].to_d.round(2)
    end

    def rates
      @rates ||= RatesResolver.new(params).call
    end
  end
end
