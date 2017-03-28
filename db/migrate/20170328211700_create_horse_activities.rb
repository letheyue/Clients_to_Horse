class CreateHorseActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :horse_activities do |t|
      t.references :horse, foreign_key: true
      t.references :activity, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.integer :status

      t.timestamps
    end
  end
end
