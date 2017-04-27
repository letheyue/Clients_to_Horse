class CreateOwnerPayments < ActiveRecord::Migration[5.0]
  def change
    create_table :owner_payments do |t|
      t.references :owner, foreign_key: true
      t.float :amount
      t.text :comment

      t.timestamps
    end
  end
end
