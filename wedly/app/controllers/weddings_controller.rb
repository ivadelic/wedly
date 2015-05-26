class WeddingsController < ApplicationController

  before_filter :require_login, except: [:index, :show]

  def index
    @weddings = if params[:search]
      Wedding.where('token LIKE?', params[:search])
    else
      Wedding.all
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @wedding = Wedding.new
  end

  def show
    @wedding = Wedding.find(params[:id])
  end

  def edit
    @wedding = Wedding.find(params[:id])
  end

  def create
    @wedding = Wedding.new(wedding_params)
    @wedding.user_id = current_user.id
    if @wedding.save
      UserMailer.partner_email(@wedding).deliver_later
      redirect_to wedding_path(@wedding), notice: "Your Wedding Key is #{@wedding.token}"
    else
      render :new
    end
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
      :partner_email,
      :token,
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
            :_destroy]
            )
  end
end