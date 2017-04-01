class AddDateToHorseActivity < ActiveRecord::Migration[5.0]
  def change
    add_column :horse_activities, :date, :datetime
  end
end
