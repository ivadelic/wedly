class AddTokenToWeddings < ActiveRecord::Migration
  def change
    add_column :weddings, :token, :string
  end
end
