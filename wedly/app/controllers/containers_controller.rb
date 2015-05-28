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
    @container = @wedding.events.containers.build(container_params)
    @event = event_id
    @container = @event.build(container_params)
  end

  def update
    @container = Container.find(params[:id])
    if @container.update_attributes(container_params)
      redirect_to wedding_path(@wedding)
    else
      redirect_to containers_path
    end
  end

  def destroy
    @container = Container.find(params[:id])
    @container.destroy
    redirect_to wedding_path(@continer.event.wedding)
  end

  private
  def container_params
    require.params(:container).permit(
    :limit,
    :event_id
    )
  end

  def load_event
    @event = Event.find(params[:event_id])
  end

end