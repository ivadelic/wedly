class ChangeDetailInFoodsTable < ActiveRecord::Migration
  def change
    add_column :foods, :wedding_id, :integer
  end
end
