class RemoveGuestIdFromGuestSpec < ActiveRecord::Migration
  def change
    remove_column :guest_specs, :guest_id, :integer
  end
end
