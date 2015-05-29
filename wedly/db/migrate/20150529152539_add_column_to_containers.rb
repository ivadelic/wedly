class AddColumnToContainers < ActiveRecord::Migration
  def change
    add_column :containers, :guest_id, :integer
  end
end
