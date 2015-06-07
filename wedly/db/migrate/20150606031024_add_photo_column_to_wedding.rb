class AddPhotoColumnToWedding < ActiveRecord::Migration
  def change
    add_column :weddings, :photo_collection_1, :string
    add_column :weddings, :photo_collection_2, :string
    add_column :weddings, :photo_collection_3, :string
  end
end
