class RemoveInvitationIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :invitation_id, :integer
  end
end
