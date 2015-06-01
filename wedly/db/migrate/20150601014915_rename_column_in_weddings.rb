class RenameColumnInWeddings < ActiveRecord::Migration
  def change
    add_column :weddings, :social_partner1_photo, :string
    add_column :weddings, :social_partner2_photo, :string
    add_column :weddings, :social_cover_photo, :string
    remove_column :weddings, :photo, :string
  end
end
