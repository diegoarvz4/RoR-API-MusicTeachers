class MusicGenresAndTeachersJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :music_teachers, :music_genres do |t|
      t.index [:music_teacher_id, :music_genre_id], name: 'teachers_and_genres_group_index'
      t.index [:music_genre_id, :music_teacher_id], name: 'genres_and_teachers_group_index'
    end
  end
end
