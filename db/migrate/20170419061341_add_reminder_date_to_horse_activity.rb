class AddReminderDateToHorseActivity < ActiveRecord::Migration[5.0]
  def change
    add_column :horse_activities, :reminder_date, :datetime
  end
end
