class AddOwnerIdToDocs < ActiveRecord::Migration[5.0]
  def change
    add_column :docs, :owner_id, :integer
  end
end
