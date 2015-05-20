class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :zip
      t.string :country
      t.string :province
      t.string :email
      t.decimal :longitude
      t.decimal :latitude
      t.integer :wedding_id

      t.timestamps null: false
    end
  end
end
