class AddMusicChoiceToComments < ActiveRecord::Migration
  def change
    add_column :comments, :music_choice, :string
  end
end
