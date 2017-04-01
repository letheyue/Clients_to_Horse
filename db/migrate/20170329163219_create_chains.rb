class CreateChains < ActiveRecord::Migration[5.0]
  def change
    create_table :chains do |t|
      t.references :activity, foreign_key: true
      t.references :procedure, foreign_key: true
      t.text :name
      t.integer :order
      t.timestamps
    end
  end
end
