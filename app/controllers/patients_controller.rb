class PatientsController < ApplicationController

  def index
    @patients = User.all
  end


end
