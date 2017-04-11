class AddTypeToOwnerPayment < ActiveRecord::Migration[5.0]
  def change
    add_column :owner_payments, :type, :integer
  end
end
