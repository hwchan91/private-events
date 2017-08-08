class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User created"
      log_in @user
      redirect_to @user
    else
      flash[:danger] = "Error"
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @created_events = @user.created_events
    @upcoming_events = @user.upcoming_events
    @past_events = @user.past_events
  end

  private
    def user_params
      params.require(:user).permit(:username)
    end

end
