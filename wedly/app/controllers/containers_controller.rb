class ContainersController < ApplicationController
  def index
    @containers = Container.all
  end

  def show
    @container = Container.find(params[:id])
  end

  def new
    @container = Container.new
  end

  def edit
    @container = Container.find(params[:id])
  end

  def create
    @container = Container.new(container_params)
      if @container.save
        redirect_to containers_url
      else
        render(:new)
    end
  end

  def update
    @container = Container.new(params[:id])
    if @container.update_attributes(container_params)
      redirect_to container_path(@container)
    else
      render :edit
    end
  end

  def destroy
    @container = Container.find(params[:id])
    @container.destroy
    redirect_to container_path
  end

  private
  def container_params(
    :limit,
    :event_id
    )
  end
end
