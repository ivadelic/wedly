class WeddingsController < ApplicationController

  before_filter :require_login, except: [:index, :show]

  def index
    @weddings = Wedding.all

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
    # w = @wedding
    # w.social_partner1_photo
    # w.social_partner2_photo
    # w.social_cover_photo
    if current_user
      @comment = @wedding.comments.build
    end
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
    w = @wedding
    w.social_partner1_photo.current_path
    w.social_partner2_photo.current_path
    w.social_cover_photo.current_path
    w.save!
    if @wedding.update_attributes(wedding_params)
      if wedding_params[:registries_attributes].present?
        redirect_to wedding_registries_path(@wedding)
      elsif wedding_params[:events_attributes].present?
        redirect_to wedding_events_path(@wedding)
      else
        redirect_to wedding_path(@wedding)
      end
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
    params.require(:wedding)
          .permit(:partner_1,
                  :partner_2,
                  :partner_email,
                  :token,
                  :user_id,
                  :social_cover_photo,
                  :social_partner2_photo,
                  :social_partner1_photo,
                  :photo_collection_1,
                  :photo_collection_2,
                  :photo_collection_3,
                  :_destroy,
                  guests_attributes: [
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
                    :_destroy,
                    containers_attributes: [
                      :id,
                      :container_id,
                      :food_id,
                      :food_restrictions,
                      :rsvp,
                      :first_name,
                      :last_name,
                      :limit,
                      :event_id,
                      :_destroy
                    ]
                      ],
                  registries_attributes: [
                    :id,
                    :wedding_id,
                    :link_to_registry,
                    :store,
                    :image_url,
                    :_destroy
                      ],
                      invitations_attributes: [
                        :recipient_email,
                        :token,
                        :wedding_id,
                        :send_time
                        ])
  end
end