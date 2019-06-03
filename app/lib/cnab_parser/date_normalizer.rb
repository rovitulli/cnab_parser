##
# Normalizes given date and time
module CnabParser
  class DateNormalizer
    attr_reader :date, :time, :datetime_ruby_class

    def initialize(args)
      @date = args.fetch("date")
      @time = args.fetch("time")
      @datetime_ruby_class = args.fetch("datetime_ruby_class", DateTime)
    end

    def normalize
      datetime_ruby_class.parse(date+time)
    end
  end
end
