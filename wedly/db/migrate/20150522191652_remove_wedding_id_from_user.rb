class RemoveWeddingIdFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :wedding_id, :integer
  end
end
