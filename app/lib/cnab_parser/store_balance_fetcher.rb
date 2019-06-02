module CnabParser
  module StoreBalanceFetcher
    module_function

    def fetch(store_id)
      Store.find(store_id).current_balance
    end
  end
end
