class AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[show destroy]

  def index
    @appointments = Appointment.all
  end

  def new
    @appointment = Appointment.new
  end

  def show; end

  def create
    @appointment = current_doctor.appointments.new appointment_params
    if @appointment.save
      redirect_to @appointment
    else
      render :new
    end
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_path
  end

  private

  def set_appointment
    @appointment = Appointment.all.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:topic, :diagnosis, :referral, :patient_id, :doctor_id)
  end
end