module Calculator
  module Computations
    class Base
      attr_reader :context

      def self.call!(context)
        self.new(context).call!
      end

      def initialize(context)
        @context = context
      end

      def call!
        raise NotImplementedError, 'Computation should respond to :call! method'
      end

    end
  end
end
