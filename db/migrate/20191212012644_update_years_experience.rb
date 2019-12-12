class UpdateYearsExperience < ActiveRecord::Migration[5.2]
  def change
    remove_column :music_teachers, :years_experiencie
    add_column :music_teachers, :years_exp, :integer
  end
end
