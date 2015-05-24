class RegistriesController < ApplicationController
  before_filter :load_wedding
  def index
    @registries = Registry.all
  end

  def show
    @registry = Registry.find(params[:id])
  end

  def new
    @registry = Registry.new
  end

  def create
    @event = @wedding.events.build(events_params)
    @wedding = wedding_id
  end

  def update
    @registry = Registry.find(params[:id])
      if @registry.update_attributes(registries_params)
        @registry.save
      else redirect_to wedding_registries_path
    end
  end

  def destroy
    @registry = Registry.find(params[:id])
    @registry.destroy
    redirect_to wedding_path(@registry.wedding)
  end

  private
  def registry_params
    params.require(:registry).permit(
      :wedding_id,
      :link_to_registry,
      :store,
      :image_url
      )
  end
  def load_wedding
    @wedding = Wedding.find(params[:wedding_id])
  end
end
