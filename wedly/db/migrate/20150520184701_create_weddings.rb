class CreateWeddings < ActiveRecord::Migration
  def change
    create_table :weddings do |t|
      t.integer :partner_1
      t.integer :partner_2

      t.timestamps null: false
    end
  end
end
