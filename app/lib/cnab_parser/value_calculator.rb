module CnabParser
  module ValueCalculator
    module_function

    def normalize(value)
      value.to_i / 100
    end
  end
end
