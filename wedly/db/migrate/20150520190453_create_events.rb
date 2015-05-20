class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :province
      t.string :zip
      t.string :country
      t.decimal :longitude
      t.decimal :latitude
      t.integer :wedding_id

      t.timestamps null: false
    end
  end
end
