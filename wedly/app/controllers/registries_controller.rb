class RegistriesController < ApplicationController
  before_filter :load_wedding
  def index
    @registries = Registry.all
  end

  def show
    @registry = Registry.find(params[:id])
  end

  def edit
    @registry = Registry.find(params[:id])
  end

  def new
    @registry = Registry.new
  end

  def create
    @registry = Registry.new(registry_params)
    #@registry = @wedding.registries.build(events_params)
    #@wedding = wedding_id
    @registry = Registry.new(registry_params)
    if @registry.save
      flash[:notice] = "Registry added"
    else
      flash[:notice] = "Registry couldn't be added"
    end
    redirect_to wedding_registries_path(@registry.wedding)
  end

  def update
    @registry = Registry.find(params[:id])
    if @registry.update_attributes(registry_params)
      redirect_to wedding_registries_path(@wedding)
    else
      render :edit
    end
    @registry.save
  end

  def destroy
    @registry = Registry.find(params[:id])
    @registry.destroy
    redirect_to wedding_registries_path(@wedding)
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
