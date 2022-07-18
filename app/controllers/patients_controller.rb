class PatientsController < ApplicationController

  def index
    @patients = Patient.all
  end

  def update_status
    @patient = Patient.find(params[:id])
    @patient.update(status: params[:status])
    redirect_to @patient
  end
end
