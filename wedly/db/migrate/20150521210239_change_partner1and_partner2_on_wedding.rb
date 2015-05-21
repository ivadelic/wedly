class ChangePartner1andPartner2OnWedding < ActiveRecord::Migration
  def change
    change_column :weddings, :partner_1, :string
    change_column :weddings, :partner_2, :string
  end
end
