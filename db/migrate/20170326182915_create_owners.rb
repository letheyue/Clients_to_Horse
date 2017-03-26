class CreateOwners < ActiveRecord::Migration[5.0]
  def change
    create_table :owners do |t|
      t.string :name
      t.text :address
      t.text :phone_number
      t.text :fax_number
      t.text :email
      t.text :comments

      t.timestamps
    end
  end
end
