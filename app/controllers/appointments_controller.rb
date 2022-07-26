class AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[show destroy update update_referral]

  def index
    @appointments = Appointment.all
  end

  def new
    @appointment = Appointment.new
  end

  def show
    @patient = Patient.all.find_by(id: @appointment.patient_id)
    @doctor = Doctor.all.find_by(id: @appointment.doctor_id)
  end

  def create
    @appointment = current_doctor.appointments.new appointment_params
    if @appointment.save
      @medicine_participants = current_doctor.medicine_participants.create(appointment_id: @appointment.id)
      binding.pry
      redirect_to @appointment
    else
      render :new
    end
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_path
  end

  def update
    @appointment.update appointment_params
  end


  def update_referral
    if @appointment.update appointment_params
      redirect_to appointment_path(@appointment)
      @medicine_participants = current_doctor.medicine_participants.create(appointment_id: @appointment.id)
    else
      flash[:danger] = "Referral wasn't update"
    end
  end

  private

  def set_appointment
    @appointment = Appointment.all.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:topic, :diagnosis, :referral, :patient_id, :doctor_id)
  end
end