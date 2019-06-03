##
# Transalates numeric type into behavior
module CnabParser
  class TransactionBehaviorTranslator
    attr_reader :transaction_type

    BEHAVIOR_DICTIONARY = { '1' => :+,
                            '2' => :-,
                            '3' => :-,
                            '4' => :+,
                            '5' => :+,
                            '6' => :+,
                            '7' => :+,
                            '8' => :+,
                            '9' => :-
                          }

    def initialize(args)
      @transaction_type = args.fetch("transaction_type")
    end

    def translate
      BEHAVIOR_DICTIONARY[transaction_type]
    end
  end
end
