class RemovePeriodFromActivity < ActiveRecord::Migration[5.0]
  def change
    remove_column :activities, :period, :integer
  end
end
