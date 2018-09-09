class BookingsController < ApplicationController
  def create
    authorize @booking = Booking.new(safe_params)
    @booking.user = current_user
    apartment = Apartment.find(params[:apartment_id])
    if !chronological?(@booking.start_date, @booking.end_date)
      flash[:alert] = "Starting date cannot be posterior to ending date."
    elsif period_available?([@booking.start_date, @booking.end_date], apartment)
      @booking.apartment_id = apartment.id
      @booking.status = 'pending'
      @booking.save!
      flash[:notice] = "Your booking has successfully been requested to the owner."
    else
      flash[:alert] = "The apartment is not available for the dates you have selected. Please review the booking period."
    end
    redirect_to apartment_path(apartment)
  end

  def index
    authorize @bookings = policy_scope(Booking)
  end

  def update
    authorize booking = Booking.find(params[:id])
    booking.status = params[:status]
    booking.save!
    redirect_to bookings_path
  end

  private

  def safe_params
    params.require(:booking).permit(:apartment, :start_date, :end_date)
  end

  def chronological?(date1, date2)
    date1 < date2
  end

  def dates_overlap?(period1, period2)
    period1.to_a.last >= period2.to_a.first
  end

  def period_available?(period, apartment)
    apartment = Apartment.find(apartment.id)
    !apartment.bookings.find { |booking| dates_overlap?(period, [booking.start_date, booking.end_date]) }
  end
end
