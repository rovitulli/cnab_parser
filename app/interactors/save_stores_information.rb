class SaveStoresInformation
  include Interactor

  def call
    context.filedata.each do |store|
      record_store(store)
    end
  end

  def record_store(store)
    Store.find_or_create_by(name: store["name"]) do |st|
      st.owner = store["owner"]
      st.cpf_code = store["cpf_code"]
    end
  end
end
