##
# Fetch current store balance from DB
module CnabParser
  class StoreBalanceFetcher
    attr_reader :store_id, :store_class

    def initialize(args = {})
      @store_id = args.fetch(:store_id)
      @store_class = args.fetch(:store_class, Store)
    end

    def fetch
      store_class.find(store_id).current_balance
    end
  end
end
