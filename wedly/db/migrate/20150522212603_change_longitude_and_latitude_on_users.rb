class ChangeLongitudeAndLatitudeOnUsers < ActiveRecord::Migration
  def change
    rename_column :users, :longtitude, :longitude
    change_column :users, :longitude, :decimal, precision: 9, scale: 6
    change_column :users, :latitude, :decimal, precision: 9, scale: 6
  end
end
