class SorceryCore < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :province
      t.string :country
      t.string :zip
      t.string :phone
      t.decimal :longtitude
      t.decimal :latitude
      t.integer :wedding_id
      t.string :email,            :null => false
      t.string :crypted_password
      t.string :salt

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end