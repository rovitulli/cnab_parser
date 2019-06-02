class FetchStoresIds
  include Interactor

  def call
    fetch
  end

  def fetch
    context.filedata.each do |transaction|
      store_name = transaction["name"].strip.capitalize
      store_id = Store.find_by_name(store_name).id
      transaction["store_id"] = store_id
    end
  end
end
