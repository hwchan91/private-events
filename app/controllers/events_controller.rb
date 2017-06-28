class EventsController < ApplicationController
  before_action :is_logged_in?, only: [:new, :create]

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      flash[:success] = "Event created"
      redirect_to events_url
    else
      flash[:danger] = "Something went wrong. Please check again."
      render "create"
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @upcoming_events = Event.upcoming
    @past_events = Event.past
  end

  private
    def event_params
      params.require(:event).permit(:description, :date)
    end

    def is_logged_in?
      unless logged_in?
        flash[:danger] = "Please login"
        redirect_to login_url
      end
    end

end
