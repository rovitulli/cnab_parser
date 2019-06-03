##
# Normalizes and calculates transaction values 
module CnabParser
  class ValueCalculator
    attr_reader :value

    def initialize(args)
      @value = args.fetch("value")
    end

    def calculate
      value.to_i / 100.00
    end
  end
end
