class ChangeRecipientIdToUserIdInInvitations < ActiveRecord::Migration
  def change
    rename_column :invitations, :recipient_id, :user_id
  end
end
