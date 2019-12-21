# frozen_string_literal: true

class AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[destroy]

  def index
    appointments = current_user.appointments
    render json: appointments,
           except: %i[created_at updated_at],
           status: :ok
  end

  def create
    appointment = current_user.appointments.create!(appointment_params)
    render json: appointment,
           except: %i[created_at updated_at],
           status: :created
  end

  def destroy
    @appointment.destroy
    head :no_content
  end

  private

  def appointment_params
    params.permit(:date, :music_teacher_id, :user_id)
  end

  def set_appointment
    @appointment = Appointment.find_by!(id: params[:id])
  end
end
