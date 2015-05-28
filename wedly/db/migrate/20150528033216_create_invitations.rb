class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :wedding_id
      t.string :recipient_email, null: false
      t.string :token
      t.datetime :send_time

      t.timestamps null: false
    end
  end
end
