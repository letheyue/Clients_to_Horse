class AddReminderOrderToHorseActivity < ActiveRecord::Migration[5.0]
  def change
    add_column :horse_activities, :reminder_order, :integer
  end
end
