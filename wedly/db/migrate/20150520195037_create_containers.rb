class CreateContainers < ActiveRecord::Migration
  def change
    create_table :containers do |t|
      t.integer :limit
      t.integer :event_id

      t.timestamps null: false
    end
  end
end
