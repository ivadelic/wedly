class GuestsController < ApplicationController
  before_filter :load_wedding
  def index
    @guests = Guest.all
    @guest = Guest.new
      if @guest.save
      render :index
      else render :new
    end
  end

  def new
    @guest = Guest.new
  end

  def edit
    @guest = Guest.find(params[:id])
  end

  def show
    @guest = Guest.find(params[:id])
  end

  def create
    @guest = @wedding.guests.build(guest_params)
    @wedding = wedding_id
    if @guest.save
      redirect_to guests_url
    else
      render :new
    end
  end

  def update
    @guest = Guest.new(params[:id])
    if @guest.update_attributes(wedding_guests_params)
      @registry.save
    else 
      redirect_to "/weddings/#{@wedding.id}/guests"
    end
  end

  def destroy
    @guest = Guest.find(params[:id])
    @guest.destroy
    flash[:notice] = "Guest #{guest.first_name} #{guest.last_name} has been deleted."
  end

  private
  def guest_params
    params.require(:guest).permit(
      :first_name,
      :last_name,
      :container_id,
      :food_choice,
      :food_restrictions,
      :rsvp,
      :user_id,
      :wedding_id)
  end

  def load_wedding
    @wedding = Wedding.find(params[:wedding_id])
  end
end