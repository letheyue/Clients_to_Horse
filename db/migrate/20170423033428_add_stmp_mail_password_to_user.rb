class AddStmpMailPasswordToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :smtp_mail_password, :text
  end
end
