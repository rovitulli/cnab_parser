##
# Saves transactions into DB
class SaveTransactionsInformation
  include Interactor

  before do
    context.balance_calculator ||= CnabParser::BalanceCalculator
    context.store_balance_fetcher ||= CnabParser::StoreBalanceFetcher
    context.transaction_class ||= Transaction
  end

  def call
    fail unless save_transactions
  end

  def calculate_balance(store_id, transaction_value, transaction_behavior)
    args = { store_current_balance: fetch_store_balance(store_id),
             transaction_value: transaction_value,
             transaction_behavior: transaction_behavior
    }
    context.balance_calculator.new(args).calculate
  end

  def fetch_store_balance(store_id)
    args = {store_id: store_id }
    context.store_balance_fetcher.new(args).fetch
  end

  def save_transactions
    context.filedata.each do |transaction|
      balance = calculate_balance(transaction[:store_id], transaction[:value], transaction[:transaction_behavior])
 
      context.transaction_class.create(store_id: transaction[:store_id],
                                       transaction_type: transaction[:transaction_type],
                                       readable_type: transaction[:readable_type],
                                       datetime: transaction[:datetime],
                                       value: transaction[:value],
                                       balance: balance,
                                       card_number: transaction[:card_number])
    end
  end

  def fail
    context.fail!(message: 'Could not save transaction')
  end
end

