class CreateMusicTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :music_teachers do |t|
      t.string :name
      t.integer :years_experiencie
      t.float :ranking

      t.timestamps
    end
  end
end
