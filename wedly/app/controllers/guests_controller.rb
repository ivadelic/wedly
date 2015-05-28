class GuestsController < ApplicationController
  before_filter :load_wedding

  def index
    @guests = Guest.all
  end

  def rsvp_true
    confirm = 0
    @guests.each do |guest|
      if guest.rsvp == true
        confirm += 1
      end
    end
    puts confirm
  end

  def show
    @guest = Guest.find(params[:id])
  end

  def new
    @guest = Guest.new
  end

  def create
    @guest = Guest.new(guest_params)
    @wedding = Wedding.find(params[:wedding_id])
    @user = current_user
    @foods = Food.where(@wedding_id)
    @guest.food = @wedding.foods.find_by(food_choice: food_choice_params[:food_id])
    if @guest.save
      flash[:notice] = "Guest added"
    else
      flash[:notice] = "Guest couldn't be added"
    end
    redirect_to wedding_guests_path(@guest.wedding)
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
    @guest.save
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
      :food_restrictions,
      :rsvp,
      :user_id,
      :wedding_id)
  end

  def food_choice_params
    params.require(:guest).permit(:food_id)
  end

  def load_wedding
    @wedding = Wedding.find(params[:wedding_id])
  end
end