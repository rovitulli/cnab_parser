module CnabParser
  ##
  # Interpreta saida do astats
  module StoreFinder
    module_function

    def find_id(store_name)
      name = store_name.strip.normalize
      fetched = Store.find_by_name(name)
      fetched.id
    end
  end
end
