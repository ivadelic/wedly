class CreateGuestSpecs < ActiveRecord::Migration
  def change
    create_table :guest_specs do |t|
      t.integer :guest_id
      t.integer :container_id
      t.integer :food_choice
      t.text :food_restrictions
      t.boolean :rsvp

      t.timestamps null: false
    end
  end
end
