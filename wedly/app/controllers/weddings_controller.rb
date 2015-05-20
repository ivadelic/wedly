class WeddingsController < ApplicationController

  def show
    @wedding = Wedding.find(params[:id])
  end

  def find
    @wedding = Wedding.find(params[:id])
  end

  def new
    @wedding = Wedding.new
  end

  def edit
    @wedding = Wedding.find(params[:id])
  end

  def create
    @wedding = Wedding.new(wedding_params)
    if @wedding.save
      redirect_to users_url, notice: "Wedding created!"
    else
      render :new
    else
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
    redirect_to users_url
  end

  private
  def wedding_params
    params.require(:wedding).permit(:partner_1, :partner_2)
  end
end
