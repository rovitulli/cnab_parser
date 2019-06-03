class SaveStoresInformation
  include Interactor

  before do
    context.store_class ||= Store
  end

  def call
    fail unless save_stores
  end

  def save_stores
    context.filedata.each do |store|
      context.store_class.find_or_create_by(name: store["name"]) do |st|
        st.owner = store["owner"]
        st.cpf_code = store["cpf_code"]
      end
    end
  end

  def fail
    context.fail!(message: "Could not save stores")
  end
end
