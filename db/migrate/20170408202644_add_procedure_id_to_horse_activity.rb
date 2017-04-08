class AddProcedureIdToHorseActivity < ActiveRecord::Migration[5.0]
  def change
    add_reference :horse_activities, :procedure, foreign_key: true
  end
end
