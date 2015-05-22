class AddWeddingIdToGuest < ActiveRecord::Migration
  def change
    add_column :guests, :wedding_id, :integer
  end
end
