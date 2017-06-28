class UserEventsController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    current_user.attend(event)
    redirect_to event
  end

  def destroy
    event = UserEvent.find(params[:id]).attending_event
    current_user.unattend(event)
    redirect_to event
  end
end
