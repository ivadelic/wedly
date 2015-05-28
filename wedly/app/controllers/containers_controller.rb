class ContainersController < ApplicationController
  before_filter :load_event

  def index
    @containers = Container.all
  end

  def show
    @container = Container.find(params[:id])
  end

  def new
  end

  def edit
    @container = Container.find(params[:id])
  end

  def create
    @container = @event.build(container_params)
    @event = event_id
  end

  def update
    @container = Container.new(params[:id])
    if @container.update_attributes(container_params)
      @container.save
    else
      redirect_to container_path(@container)
    end
  end

  def destroy
    @container = Container.find(params[:id])
    @container.destroy
    redirect_to container_path
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