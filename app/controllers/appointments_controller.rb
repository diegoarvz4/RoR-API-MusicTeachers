class AppointmentsController < ApplicationController
  before_action :set_appointments
  before_action :set_appointment, only: [:show, :update, :destroy]

  def index
    appointments = current_user.appointments
    json_response(appointments)
  end

  def show
    json_response(@appointment)
  end

  def create
    appointment = current_user.appointments.create!(appointment_params)
    json_response(appointment, :created)
  end

  def update
    @appointment.update(appointment_params)
    head :no_content
  end

  def destroy
    @appointment.destroy
    head :no_content
  end

  private

  def appointment_params
    params.permit(:date, :music_teacher_id, :user_id)
  end

  def set_appointments
    @appointments = Appointment.all
  end

  def set_appointment
    @appointment = Appointment.find_by!(id: params[:id])
  end

end
