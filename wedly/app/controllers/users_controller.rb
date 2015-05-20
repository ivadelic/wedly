class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to events_url, notice: "Hello! You're signed up!"
    else
      render "new"
    end
  end

  def destroy
    @user = User.find(user_params[:id])
    @user.destroy
  end

  private
  def user_params(
    :first_name,
    :last_name,
    :address_line_1,
    :address_line_2,
    :city,
    :zip,
    :country,
    :province,
    :email,
    :longitude,
    :latitude
    )
  end
end
