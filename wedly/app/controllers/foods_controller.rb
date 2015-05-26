class FoodsController < ApplicationController
  def index
    @foods = Food.all
    @food = Food.new
  end


  private
  def food_params
    params.require(:food).permit(
      :food_choice
      )
  end

  def load_wedding
    @wedding = Wedding.find(params[:wedding_id])
  end
end
