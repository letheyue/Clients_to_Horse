class CreateDocs < ActiveRecord::Migration[5.0]
  def change
    create_table :docs do |t|
      t.text :description
      t.string :file_name
      t.string :short_name
      t.integer :owner_horse_id
      t.timestamps
    end
  end
end
