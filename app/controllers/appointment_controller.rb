class AppointmentController < ApplicationController
  def create_appointment
    @appointment = current_doctor.appointments.build appointment_params
  end

  private

  def appointment_params
    params.require(:appointment).permit(:topic, :diagnosis, :referral)
  end
end