class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [:show]

  def show
    @review = Review.new
    @reviews = @restaurant.reviews
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(params_restaurant)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def index
    @restaurants = Restaurant.all
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def params_restaurant
    params.require(:restaurant).permit(:name, :address, :category, :phone_number)
  end
end
