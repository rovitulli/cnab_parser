class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :store_id
      t.integer :transaction_type
      t.string :readable_type
      t.datetime :datetime
      t.float :value
      t.float :balance, :default => 0
      t.string :card_number

      t.timestamps null: false
    end
  end
end
