class ReviewsController < ApplicationController
  def create
    authorize @review = Review.new(apartment: Apartment.find(params[:apartment_id]))
    @review.attributes = safe_params
    @review.user = current_user
    @review.save!
    redirect_to apartment_path(@review.apartment)
  end

  private

  def safe_params
    params.require(:review).permit(:score, :text)
  end
end
