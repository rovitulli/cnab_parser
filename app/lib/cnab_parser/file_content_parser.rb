##
# Parsers files
module CnabParser
  class FileContentParser
    attr_reader :file_path, :ruby_file_class

    PARSE_REGEX = /^(?<transaction_type>[0-9]{1})(?<date>[0-9]{8})(?<value>[0-9]{10})(?<cpf_code>[0-9]{11})(?<card_number>.{12})(?<time>[0-9]{6})(?<owner>.{14})(?<name>.{18,})/

    def initialize(args)
      @file_path = args.fetch(:file_path)
      @ruby_file_class = args.fetch(:ruby_file_class, File)
    end

    def parse
      data = []

      ruby_file_class.foreach(file_path) do |line|
        result = line.match(PARSE_REGEX)
        next unless result
        
        #named_capures·transform·MatchData·in·simple·hashes
        simbolized = symbolize_hash(result.named_captures)
        data << simbolized
      end

      data
    end

    def symbolize_hash(arg)
      arg.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}
    end
  end
end
