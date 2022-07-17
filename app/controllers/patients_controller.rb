class PatientsController < ApplicationController
  def update_status
    @patient = Patient.find(params[:id])
    @patient.update(status: params[:status])
    redirect_to @patient
  end
end
