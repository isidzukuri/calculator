# frozen_string_literal: true

module Calculator
  class Processor
    attr_reader :context

    def initialize(params)
      @context = Context.new(params)
    end

    def call
      Computations.call!(context)

      [context[:net_amount].to_f, context[:commission_total].to_f]
    end
  end
end
