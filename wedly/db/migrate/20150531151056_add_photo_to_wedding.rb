class AddPhotoToWedding < ActiveRecord::Migration
  def change
    add_column :weddings, :photo, :string
  end
end
