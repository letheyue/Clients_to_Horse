class AddBalanceToOwnerPayment < ActiveRecord::Migration[5.0]
  def change
    add_column :owner_payments, :balance, :float
  end
end
