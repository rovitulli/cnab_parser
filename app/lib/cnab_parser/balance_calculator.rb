##
# Calculate value pos transaction

module CnabParser
  class BalanceCalculator
    attr_reader :store_current_balance,
                :transaction_value,
                :transaction_behavior

    def initialize(args = {})
      @store_current_balance = args.fetch(:store_current_balance)
      @transaction_value = args.fetch(:transaction_value)
      @transaction_behavior = args.fetch(:transaction_behavior)
    end

    def calculate
      store_current_balance.send(transaction_behavior, transaction_value)
    end
  end
end
