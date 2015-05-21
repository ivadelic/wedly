class GuestController < ApplicationController

  def index
    @guests = Guest.all
  end

  def new
    @guest = Guest.new
  end

  def edit
    @guest = Guest.find
  end

  def show
    @guest = Guest.find(params[:id])
  end

  def create
    @guest = Guest.new(guest_params)
    if @guest.save
      redirect_to guests_url
    else
      render :new
    end
  end

  def update
    @guest = Guest.new(params[:id])
    if @guest.update_attributes(guest_params)
      redirect_to guest_path(@guest)
    else
      render :edit
    end
  end

  def destroy
    @guest = Guest.find(params[:id])
    @guest.destroy
    flash[:notice] = "Guest #{guest.first_name} #{guest.last_name} has been deleted."
  end

  private
  def guest_params
    params.require(:guest).permit(:first_name, :last_name, :container_id, :food_choice, :food_restrictions, :rsvp, :user_id)
  end
end