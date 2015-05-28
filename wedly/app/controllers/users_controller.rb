class UsersController < ApplicationController

  skip_before_filter :require_login, only: [:new, :create]

  def new
    @user = User.new(:invitation_token => params[:token])
      @user.email = @user.invitation.recipient_email if @user.invitation
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      UserMailer.welcome_email(@user).deliver_later
      redirect_to root_url, notice: "Hello! You're signed up!"
    else
      redirect_to new_user_url, alert: @user.errors.full_messages
    end
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      redirect_to root_url, notice: 'Profile updated!'
    else
      redirect_to edit_user_url, alert: @user.errors.full_messages
    end
  end

  def destroy
    @user = current_user
    @user.destroy
  end

  private
  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :address_line_1,
      :address_line_2,
      :city,
      :zip,
      :country,
      :province,
      :email,
      :phone,
      :password,
      :password_confirmation,
      :longitude,
      :latitude,
      :invitation_id
      )
  end
end
