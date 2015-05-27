class FoodsController < ApplicationController
  before_filter :load_wedding

  def index
    @foods = Food.all
    @food = Food.new
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)

    if @food.save
      flash[:notice] = "Menu option added"
    else
      flash[:notice] = "Menu option couldn't be added"
    end
    redirect_to wedding_event_foods_path(@wedding, @event)
  end

  def edit
    @food = Food.find(params[:id])
  end

  def update
    @food = Food.find(params[:id])

    if @food.update_attributes(food_params)
      redirect to wedding_event_foods_path(@wedding)
    else
      render :edit
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to wedding_event_foods_path(@wedding, @event)
  end


  private
  def food_params
    params.require(:food).permit(
      :food_choice,
      :event_id,
      :dish_name,
      :dish_description,
      )
  end

  def load_wedding
    @wedding = Wedding.find(params[:wedding_id])
  end
end
