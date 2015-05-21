class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :food_choice
      t.integer :event_id

      t.timestamps null: false
    end
  end
end
