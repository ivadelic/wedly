class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.integer :votes
      t.integer :wedding_id
      t.integer :song_id

      t.timestamps null: false
    end
  end
end
