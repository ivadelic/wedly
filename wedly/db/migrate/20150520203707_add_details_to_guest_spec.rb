class AddDetailsToGuestSpec < ActiveRecord::Migration
  def change
    add_column :guest_specs, :first_name, :string
    add_column :guest_specs, :last_name, :string
    add_column :guest_specs, :user_id, :integer
  end
end
