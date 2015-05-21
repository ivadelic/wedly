class SorceryCore < ActiveRecord::Migration
  def change
    create_table :users do |t|
      first_name
      last_name
      address_line_1
      address_line_2
      city
      province
      country
      zip
      phone
      longtitude
      latitude
      t.string :email,            :null => false
      t.string :crypted_password
      t.string :salt

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end