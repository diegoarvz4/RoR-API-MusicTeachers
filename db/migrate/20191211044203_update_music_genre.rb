class UpdateMusicGenre < ActiveRecord::Migration[5.2]
  def change
    remove_column :music_genres, :type
    add_column :music_genres, :category, :string
  end
end
