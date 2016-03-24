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

  def destroy
    @user = User.find_by(id: params[:id])
    if admin? && @user.id > 2
      @user.destroy
      redirect_to patients_path
    else
      flash[:notice] = "You do not have the required credentials to perform such an action"
      redirect_to patients_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :name, :age, :gender, :insurance)
  end
end
