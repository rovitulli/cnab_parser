module CnabParser
  class StoreFinder
    attr_reader :store_name, :store_class

    def initialize(args)
      @store_name = args.fetch("store_name")
      @store_class = args.fetch("store_class", Store)
    end

    def find_id
      store_class.find_by_name(store_name).id
    end
  end
end
