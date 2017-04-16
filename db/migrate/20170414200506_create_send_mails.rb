class CreateSendMails < ActiveRecord::Migration[5.0]
  def change
    create_table :send_mails do |t|
      t.text :subject
      t.text :comment
      t.references :owner, foreign_key: true

      t.timestamps
    end
  end
end
