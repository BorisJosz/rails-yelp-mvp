class ReviewsController < ApplicationController

  def new
    set_restaurant
    @review = Review.new
  end

  def create
  set_restaurant
   @review = Review.new(reviews_params)
   @review.restaurant = @restaurant
   if @review.save
    redirect_to restaurant_path(@restaurant)
  else
    render :new
  end
end

private

def set_review
  @review = Review.find(params[:id])
end

def reviews_params
  params.require(:review).permit(:content, :rating)
end

def set_restaurant
  @restaurant = Restaurant.find(params[:restaurant_id])
end

end
