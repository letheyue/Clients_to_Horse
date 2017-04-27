class AddPriceToHorseActivity < ActiveRecord::Migration[5.0]
  def change
    add_column :horse_activities, :price, :float
  end
end
