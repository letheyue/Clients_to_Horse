class AddProcedureNameToOwnerPayment < ActiveRecord::Migration[5.0]
  def change
    add_column :owner_payments, :procedure_name, :text
  end
end
