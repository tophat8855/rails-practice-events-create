class EventsController < ApplicationController
  before_action :find_event, only: [:show, :edit, :update]
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    @event.update(event_params)
    if @event.save
      redirect_to events_path
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  private
  def event_params
    params.require(:event).permit(:date, :description, :requires_id, :capacity, :directions)
  end

  def find_event
    @event = Event.find(params[:id])
  end
end
