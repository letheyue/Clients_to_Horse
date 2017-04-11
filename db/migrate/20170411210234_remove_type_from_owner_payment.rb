class RemoveTypeFromOwnerPayment < ActiveRecord::Migration[5.0]
  def change
    remove_column :owner_payments, :type, :integer
  end
end
