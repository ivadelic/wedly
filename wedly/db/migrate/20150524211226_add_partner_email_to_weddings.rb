class AddPartnerEmailToWeddings < ActiveRecord::Migration
  def change
    add_column :weddings, :partner_email, :string
  end
end
