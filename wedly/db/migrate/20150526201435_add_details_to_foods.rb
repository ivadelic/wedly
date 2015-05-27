class AddDetailsToFoods < ActiveRecord::Migration
  def change
    add_column :foods, :dish_name, :string
    add_column :foods, :dish_description, :text
  end
end
