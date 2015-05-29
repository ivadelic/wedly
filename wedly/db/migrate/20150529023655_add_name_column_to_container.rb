class AddNameColumnToContainer < ActiveRecord::Migration
  def change
    add_column :containers, :name, :string
  end
end
