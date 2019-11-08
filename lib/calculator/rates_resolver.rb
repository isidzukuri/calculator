# frozen_string_literal: true

module Calculator
  class RatesResolver
    DEFAULT_COMMISSION_AMOUNT = 0
    DEFAULT_COMMISSION_PERCENT = 0

    attr_reader :params

    def initialize(params)
      @params = params
    end

    def call
      {
        commission_amount: commission_amount.to_d,
        commission_percent: commission_percent.to_d
      }
    end

    def commission_percent
      commission_entity(:commission_percent) ||
        params[:commission_percent] ||
        DEFAULT_COMMISSION_PERCENT
    end

    def commission_amount
      commission_entity(:commission_amount) ||
        params[:commission_amount] ||
        DEFAULT_COMMISSION_AMOUNT
    end

    private

    def commission_entity(attr)
      return unless params[:commission_entity].respond_to?(attr)

      params[:commission_entity].public_send(attr)
    end
  end
end
