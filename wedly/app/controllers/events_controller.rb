class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(event_params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_url
    else
      render(:new)
    end
  end

  def edit
    @event = Event.find
  end

  def update
    @event = Event.find(event_params[:id])
      if @event.update_attributes(event_params)
        @event.save
      else redirect_to events_path
    end
  end

  def destroy
    @event = Event.find(event_params[:id])
    @event.destroy
  end

  private
  def event_params
    params.require(:event).permit(
      :address_line_1,
      :address_line_2,
      :city,
      :province,
      :zip,
      :country,
      :longitude,
      :latitude,
      :wedding_id
      )
  end
end
