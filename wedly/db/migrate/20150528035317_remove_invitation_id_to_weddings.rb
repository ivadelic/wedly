class RemoveInvitationIdToWeddings < ActiveRecord::Migration
  def change
    remove_column :weddings, :invitation_id, :integer
  end
end
