class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(set_review_params)
    booking = Booking.find(params[:booking_id])
    @review.booking = booking

    if @review.save
      redirect_to office_path(booking.office)
    else
      render :new
    end
  end

  private

  def set_review_params
    params.require(:review).permit(:rating, :content)
  end
end
