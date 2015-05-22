class WeddingsController < ApplicationController

  before_filter :require_login, except: [:index, :show]

  def index
    @weddings = Wedding.all
  end

  def new
    @wedding = Wedding.new
  end

  def create
    @wedding = Wedding.new(wedding_params)
    @wedding.user_id = current_user.id
    if @wedding.save
      redirect_to wedding_path(@wedding)
    else
      render :new
    end
  end

  def show
    @wedding = Wedding.find(params[:id])
  end

  def find
    @wedding = Wedding.find(params[:id])
  end

  def edit
    @wedding = Wedding.find(params[:id])
  end

  def update
    @wedding = Wedding.find(params[:id])
    if @wedding.update_attributes(wedding_params)
      redirect_to weddings_path(@wedding)
    else
      render :edit
    end
  end

  def destroy
    @wedding = Wedding.find(params[:id])
    @wedding.destroy
    redirect_to weddings_url
  end

  private
  def wedding_params
    params.require(:wedding).permit(
      :partner_1,
      :partner_2,
      :user_id,
      guest_attributes: [
        :id,
        :container_id,
        :food_choice,
        :food_restrictions,
        :rsvp,
        :first_name,
        :last_name,
        :_destroy
        ],
          events_attributes: [
            :id,
            :name,
            :description,
            :date,
            :start_time,
            :end_time,
            :address_line_1,
            :address_line_2,
            :city,
            :province,
            :zip,
            :country,
            :longitude,
            :latitude,
            :wedding_id,
            :_destroy])
  end
end