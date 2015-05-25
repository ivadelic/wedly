class GuestsController < ApplicationController
  before_filter :load_wedding
  def index
    @guests = Guest.all
  end

  def show
    @guest = Guest.find(params[:id])
  end

  def new
    @guest = Guest.new
  end

  def create
    @guest = @wedding.guests.build(guest_params)
    @wedding = wedding_id
  end

  def edit
    @guest = Guest.find(params[:id])
  end

  def update
    @guest = Guest.find(params[:id])
    if @guest.update_attributes(guest_params)
      redirect_to wedding_guests_path(@wedding)
    else
      render :edit
    end
  end

  def destroy
    @guest = Guest.find(params[:id])
    @guest.destroy
    redirect_to wedding_guests_path(@guest.wedding)
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