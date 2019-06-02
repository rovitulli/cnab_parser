module CnabParser
  module TransactionBehavior
    module_function

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
    def calculate(transaction_type)
      BEHAVIOR_DICTIONARY[transaction_type]
    end
  end
end
