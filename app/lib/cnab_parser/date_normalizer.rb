module CnabParser
  module DateNormalizer
    module_function

    def normalize(date, time)
      DateTime.parse(date+time)
    end
  end
end
