class AddBalanceToOwner < ActiveRecord::Migration[5.0]
  def change
    add_column :owners, :balance, :float
  end
end
