class PatientsController < ApplicationController

  def index
    @patients = User.all
  end

  def show
    @patient = User.find_by(id: params[:id])
    @prescriptions = @patient.prescriptions
  end

  def new
    @patient = User.new
  end

  def create
    @patient = User.new(patient_params)
    if admin? && @patient.save
      flash[:notice] = "Patient Record created"
      redirect_to patients_path
    else
      flash[:notice] = "Invalid parameters"
      redirect_to new_patient_path
    end
  end

  def edit
    @patient = User.find_by(id: params[:id])
  end

  def update
    @patient = User.find_by(id: params[:id])
    @patient.assign_attributes(patient_params)
    if admin? && @patient.save
      flash[:notice] = "Patient records updated"
      redirect_to patients_path
    else
      flash[:notice] = "Invalid parameters"
      redirect_to edit_patient_path
    end
  end


private
  def patient_params
    params.require(:user).permit(:username, :password, :name, :age, :gender, :insurance)
  end


end
