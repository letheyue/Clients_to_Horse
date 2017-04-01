class AddCommentToHorseActivity < ActiveRecord::Migration[5.0]
  def change
    add_column :horse_activities, :comment, :text
  end
end
