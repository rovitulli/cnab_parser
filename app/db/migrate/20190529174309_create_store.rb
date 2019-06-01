class CreateStore < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |s|
      s.string :name
      s.string :owner
      s.string :cpf_code
      s.float  :current_balance, :default => 0

      s.timestamps null: false
    end
  end
end
