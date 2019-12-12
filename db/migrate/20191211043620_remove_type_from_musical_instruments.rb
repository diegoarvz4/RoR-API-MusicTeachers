class RemoveTypeFromMusicalInstruments < ActiveRecord::Migration[5.2]
  def change
    remove_column :musical_instruments, :type
    add_column :musical_instruments, :kind, :string
  end
end
