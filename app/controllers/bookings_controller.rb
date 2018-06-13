class BookingsController < ApplicationController
  def create
    authorize @booking = Booking.new(safe_params)
    @booking.save!
    apartment = Apartment.find(params[:apartment_id])
    redirect_to apartment_path(apartment)
  end

  private

  def safe_params
    params.require(:booking).permit(:apartment, :start_date, :end_date)
  end
end
