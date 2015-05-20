class RenameTableGuestSpecsToGuests < ActiveRecord::Migration
  def change
    rename_table :guest_specs, :guests
  end
end
