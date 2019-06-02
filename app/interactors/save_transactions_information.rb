class SaveTransactionsInformation
  include Interactor

  def call
    save_transactions
  end

  def calculate_balance(store_id, transaction_value, transaction_behavior)
    args = { store_current_balance: fetch_store_balance(store_id),
             transaction_value: transaction_value,
             transaction_behavior: transaction_behavior
    }
    CnabParser::CalculateBalance.calculate(args)
  end

  def fetch_store_balance(store_id)
    CnabParser::StoreBalanceFetcher.fetch(store_id)
  end

  def save_transactions
    context.filedata.each do |transaction|
      balance = calculate_balance(transaction["store_id"], transaction["value"], transaction["transaction_behavior"])
 
      Transaction.create(store_id: transaction["store_id"], 
                         transaction_type: transaction["transaction_type"],
                         readable_type: transaction["readable_type"],
                         datetime: transaction["datetime"],
                         value: transaction["value"],
                         balance: balance,
                         card_number: transaction["card"])
    end
  end
end

