class AddToComments < ActiveRecord::Migration
  def change
    add_column :comments, :note, :text
    add_column :comments, :wedding_id, :integer
    add_column :comments, :user_id, :integer
  end
end
