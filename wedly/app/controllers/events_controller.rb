class EventsController < ApplicationController
  before_filter :load_wedding

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = @wedding.events.build(events_params)
    @wedding = wedding_id
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
      if @event.update_attributes(event_params)
        @event.save
      else redirect_to events_path
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
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

  def load_wedding
    @wedding = Wedding.find(params[:wedding_id])
  end
end