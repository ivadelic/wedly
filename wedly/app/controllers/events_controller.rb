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
        redirect_to wedding_path(@wedding)
      else redirect_to events_path
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to wedding_path(@event.wedding)
  end

  private
  def event_params
    params.require(:event).permit(
      :name,
      :description,
      :date,
      :start_time,
      :end_time,
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