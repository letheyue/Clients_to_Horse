class AddHorseNameToOwnerPayment < ActiveRecord::Migration[5.0]
  def change
    add_column :owner_payments, :horse_name, :text
  end
end
