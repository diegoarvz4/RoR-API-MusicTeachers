class AddReferenceToAppointments < ActiveRecord::Migration[5.2]
  def change
    add_reference :appointments, :user, add_foreign_key: true
  end
end
