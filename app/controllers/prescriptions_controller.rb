class PrescriptionsController < ApplicationController

  def index
    @prescriptions = Prescription.all
  end

  def new
    @prescription = Prescription.new
    @users = User.all
    @medicines = Medicine.all
  end
end
