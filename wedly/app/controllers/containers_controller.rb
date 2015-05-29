class ContainersController < ApplicationController
  before_filter :load_event

  def index
    @containers = Container.all
  end

  def show
    @container = Container.find(params[:id])
    @wedding = @container.events.weddings.build
  end

  def new
  end

  def edit
    @container = Container.find(params[:id])
  end

  def create
    @container = Container.new(container_params)
    @wedding = Wedding.find(params[:wedding_id])
    @event = Event.find(params[:event_id])
    @user = current_user
    @guests = Guest.where(@event_id)
    # @event.guest = @wedding.guests.find_by(first_name: first_name_params[:guest_id])
    if @container.save
      flash[:notice] = "Container added"
    else
      flash[:notice] = "Container couldn't be added"
    end
    redirect_to wedding_event_containers_path(@event.wedding, @event)
  end

  def update
    @container = Container.find(params[:id])
    if @container.update_attributes(container_params)
      redirect_to wedding_event_containers_path(@event.wedding, @event)
    else
      render :edit
    end
    @container.save
  end

  def destroy
    @container = Container.find(params[:id])
    @container.destroy
    redirect_to wedding_event_containers_path(@event.wedding, @event)
  end

  private
  def container_params
    params.require(:container).permit(
    :limit,
    :name,
    :event_id
    )
  end

  def load_event
    @event = Event.find(params[:event_id])
  end

end