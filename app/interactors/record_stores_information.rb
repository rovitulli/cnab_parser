class RecordStoresInformation
  include Interactor

  def call
    uniq_store.each do |store|
      require 'pry'; binding.pry
      record_store(store)
    end
  end

  def normalize_matches
    matches = context.filedata
    normalized = []
    matches.each do |store|
      normalized << { name: store[:name].strip.capitalize,
                     owner: store[:owner].strip.capitalize,
                     cpf_code: store[:cpf_code].strip.capitalize }
    end

    normalized
  end

  def uniq_store
    normalize_matches.uniq {|st| st[:name] }
  end

  def record_store(store)
    Store.find_or_create_by(name: store[:name]) do |st|
      st.owner = store[:owner]
      st.cpf_code = store[:cpf_code]
    end
  end
end
