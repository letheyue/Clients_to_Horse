class RemoveEndDateFromHorseActivity < ActiveRecord::Migration[5.0]
  def change
    remove_column :horse_activities, :end_date, :datetime
  end
end
