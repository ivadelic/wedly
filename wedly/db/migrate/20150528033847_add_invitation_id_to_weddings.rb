class AddInvitationIdToWeddings < ActiveRecord::Migration
  def change
    add_column :weddings, :invitation_id, :integer
  end
end
