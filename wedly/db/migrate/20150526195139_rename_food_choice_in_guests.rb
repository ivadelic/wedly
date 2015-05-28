class RenameFoodChoiceInGuests < ActiveRecord::Migration
  def change
    rename_column :guests, :food_choice, :food_id
  end
end
