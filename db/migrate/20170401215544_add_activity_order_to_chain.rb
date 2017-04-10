class AddActivityOrderToChain < ActiveRecord::Migration[5.0]
  def change
    add_column :chains, :activity_order, :integer
  end
end
