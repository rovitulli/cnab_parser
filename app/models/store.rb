##
# Store Class
class Store < ActiveRecord::Base
  has_many :transactions

  def self.hashed
    hashed = {}
    Store.all.each do |store|
      hashed[store.name] = { info: store,
                            transactions: store.transactions}
    end
    hashed
  end
end
