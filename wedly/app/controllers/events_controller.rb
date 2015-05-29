

class EventsController < ApplicationController
  before_filter :load_wedding

  def index
    @events = if params[:search]
      Event.near(params[:search], 1, units: :km)
    elsif params[:longitude] && params[:latitude]
      Event.near([params[:latitude], params[:longitude]], 1, units: :km)
    else
    @events = Event.all
    end

    @event= Event.new

    respond_to do |format|
      format.html
      format.js #index.js.erb
    end
  end

  def show
    @event = Event.find(params[:id])
    # @wedding = Wedding.find(params[:id])
    # @wedding = @event.weddings.build(@event.wedding)
  #   @nearby_events = @event.nearbys(1, units, :km)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.wedding = @wedding
    if @event.save
      flash[:notice] = "Event saved"
      redirect_to wedding_events_path(@wedding)
    else
      render :index
    end
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
  def load_wedding
    @wedding = Wedding.find(params[:wedding_id])
  end

  def event_params
    params.require(:event)
    .permit(
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
      :wedding_id,
      foods_attributes: [
        :id,
        :food_choice,
        :event_id,
        :dish_name,
        :dish_description,
        :_destroy
      ],
      containers_attributes: [
        :id,
        :limit,
        :event_id,
        :guest_id,
        :_destroy
        ])
  end
end