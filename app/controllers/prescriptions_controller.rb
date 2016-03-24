class PrescriptionsController < ApplicationController

  def index
    @prescriptions = Prescription.all
  end

  def new
    @prescription = Prescription.new
    @users = User.all
    @medicines = Medicine.all
  end

  def create
    @prescription = Prescription.new(prescription_params)
    if admin? && @prescription.save
      flash[:notice] = "New prescription record created"
      redirect_to prescriptions_path
    else
      flash[:notice] = "The patient or medicine record is missing at the given ID"
      @users = User.all
      @medicines = Medicine.all
      render "new"
    end
  end

  def edit
    @prescription = Prescription.find_by(id: params[:id])
    @users = User.all
    @medicines = Medicine.all
  end

  def update
    @prescription = Prescription.find_by(id: params[:id])
    @prescription.assign_attributes(prescription_params)
    if admin? && @prescription.save
      flash[:notice] = "Prescription records updated"
      redirect_to prescriptions_path
    else
      flash[:notice] = "The patient or medicine record is missing at the given ID"
      @users = User.all
      @medicines = Medicine.all
      render "new"
    end
  end

  def destroy
    @prescription = Prescription.find_by(id: params[:id])
    if admin?
      @prescription.destroy
      redirect_to prescriptions_path
    else
      flash[:notice] = "You do not have the required credentials to perform such an action"
      redirect_to root_path
    end
  end


private

  def prescription_params
    params.require(:prescription).permit(:patient_id, :medicine_id)
  end
end
