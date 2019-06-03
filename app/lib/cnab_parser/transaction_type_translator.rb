##
# Transalates type into readable
module CnabParser
  class TransactionTypeTranslator
    attr_reader :transaction_type

    DICTIONARY = { '1' => 'Débito',
                   '2' => 'Boleto',
                   '3' => 'Financiamento',
                   '4' => 'Crédito',
                   '5' => 'Recebimento empréstimo',
                   '6' => 'Vendas',
                   '7' => 'Recebimento TED',
                   '8' => 'Recebimento DOC',
                   '9' => 'Aluguel' } 

    def initialize(args)
      @transaction_type = args.fetch(:transaction_type)
    end

    def translate
      DICTIONARY[transaction_type]
    end
  end
end
