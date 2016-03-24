class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      @user = User.new
      flash[:notice] = "The username or password is incorrect"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end

end
