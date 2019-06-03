##
# After saving stores in DB, this class fetches IDs by name
class FetchStoresIds
  include Interactor

  before do
    context.store_class ||= Store
  end

  def call
    fail unless fetch
  end

  def fetch
    context.filedata.each do |transaction|
      store_id = context.store_class.find_by_name(transaction[:name]).id
      transaction[:store_id] = store_id
    end
  end

  def fail
    context.fail!(message: 'Could not fetch store')
  end
end
