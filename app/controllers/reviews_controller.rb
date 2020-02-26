class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(params_review)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render 'restaurants/show'
    end
  end

  private

  def params_review
    params.require(:review).permit(:rating, :content, :restaurant_id)
  end
end
