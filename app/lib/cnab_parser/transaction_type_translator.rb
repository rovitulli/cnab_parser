module CnabParser
  module TransactionTypeTranslator
    module_function

    DICTIONARY = { '1' => "Débito",
                   '2' => "Boleto",
                   '3' => "Financiamento",
                   '4' => "Crédito",
                   '5' => "Recebimento empréstimo",
                   '6' => "Vendas",
                   '7' => "Recebimento TED",
                   '8' => "Recebimento DOC",
                   '9' => "Aluguel" } 

    def translate(transaction_type)
      DICTIONARY[transaction_type]
    end
  end
end
