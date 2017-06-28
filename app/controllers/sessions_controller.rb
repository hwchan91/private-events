class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user
      log_in @user
      flash[:success] = "Welcome"
      redirect_to events_url
    else
      flash[:danger] = 'No such user'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_url
  end
end
