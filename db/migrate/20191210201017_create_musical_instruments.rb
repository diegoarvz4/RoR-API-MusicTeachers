class CreateMusicalInstruments < ActiveRecord::Migration[5.2]
  def change
    create_table :musical_instruments do |t|
      t.string :type

      t.timestamps
    end

    create_join_table :music_teachers, :musical_instruments do |t|
      t.index [:music_teacher_id, :musical_instrument_id], name: 'teachers_and_insts_group_index'
      t.index [:musical_instrument_id, :music_teacher_id], name: 'insts_and_teachers_group_index'
    end
  end
end
