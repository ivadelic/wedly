class AddUserIdToWedding < ActiveRecord::Migration
  def change
    add_column :weddings, :user_id, :integer
  end
end
