module CnabParser
  module CalculateBalance
    module_function

    def calculate(args = {})
      store_current_balance = args.fetch(:store_current_balance)
      transaction_value = args.fetch(:transaction_value)
      transaction_behavior = args.fetch(:transaction_behavior)

      store_current_balance.send(transaction_behavior, transaction_value)
    end

  end
end
