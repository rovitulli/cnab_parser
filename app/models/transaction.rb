class Transaction < ActiveRecord::Base
  belongs_to :store
  after_save :update_store_balance

  def update_store_balance
    st = Store.find(store_id)
    st.update_attributes(current_balance: balance)
  end
end
