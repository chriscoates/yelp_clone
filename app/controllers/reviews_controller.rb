class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def review_params
    params.require(:review).permit(:thoughts, :rating)
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.build_with_user(review_params, current_user)
    if @review.save
      redirect_to restaurants_path
    else
      if @review.errors[:user]
        flash[:notice] = 'has reviewed this restaurant already'
        redirect_to restaurants_path
      else
        render 'new'
      end
    end
  end
end
