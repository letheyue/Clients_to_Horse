class RemoveStartDateFromHorseActivity < ActiveRecord::Migration[5.0]
  def change
    remove_column :horse_activities, :start_date, :datetime
  end
end
