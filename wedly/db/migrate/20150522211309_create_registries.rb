class CreateRegistries < ActiveRecord::Migration
  def change
    create_table :registries do |t|
      t.integer :wedding_id
      t.string :link_to_registry
      t.string :store
      t.string :image_url

      t.timestamps null: false
    end
  end
end
