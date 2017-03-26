class CreateHorses < ActiveRecord::Migration[5.0]
  def change
    create_table :horses do |t|
      t.string :name
      t.string :age
      t.string :sex
      t.string :breed
      t.references :owner, foreign_key: true

      t.timestamps
    end
  end
end
