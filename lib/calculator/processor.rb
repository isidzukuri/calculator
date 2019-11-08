module Calculator
  class Processor
    attr_reader :params

    def initialize(params)
      raise ArgumentError, "missing parameter :amount" unless params[:amount]

      @params = params
    end


  end
end
