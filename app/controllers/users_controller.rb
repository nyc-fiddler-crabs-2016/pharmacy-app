class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find_by(id: params[:id])
    @prescriptions = @user.prescriptions
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:notice] = "Invalid parameters"
      render"new"
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :name, :age, :gender, :insurance)
  end
end
