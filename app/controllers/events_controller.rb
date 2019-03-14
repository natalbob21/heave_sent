class EventsController < ApplicationController
before_action :find_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = current_user.events
    if @events.length.zero?
      flash[:alert] = 'You have no events. Create one now to get started.'
    end
  end

  def show

  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to @event, notice: "successfully created new Event"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: "Event was Succestfully updated!"
    else
      render 'edit'
    end
  end

  def destroy
    @event.destroy
    redirect_to root_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date, :message, :send_date)
  end

  def find_event
    @event = Event.find(params[:id])
  end
end
