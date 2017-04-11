class AddBillingTypeToOwnerPayment < ActiveRecord::Migration[5.0]
  def change
    add_column :owner_payments, :billing_type, :integer
  end
end
