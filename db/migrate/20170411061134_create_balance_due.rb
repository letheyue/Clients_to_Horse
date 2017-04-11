class CreateBalanceDue < ActiveRecord::Migration[5.0]
  def change
    create_table :balance_dues do |t|
      t.references :owner, foreign_key: true
      t.integer :amount
      t.text :comment

      t.timestamps
    end
  end
end
