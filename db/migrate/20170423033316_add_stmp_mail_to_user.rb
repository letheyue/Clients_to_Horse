class AddStmpMailToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :smtp_mail, :text
  end
end
