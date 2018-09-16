class OrdersController < ApplicationController
  skip_after_action :verify_authorized
  require 'json'
  require 'open-uri'

  def create
    booking = Booking.find(params[:booking_id])
    if booking.order && booking.order.state == 'paid'
      redirect_to order_path(booking.order)
      return
    elsif  booking.order
      order = booking.order
    elsif booking.status == "approved"
      order = Order.create!(apartment_sku: booking.id, booking: booking, amount: (booking.days * 6).round, state: 'pending', user: current_user)
    end
    redirect_to new_order_payment_path(order.id)
  end

  def show
    @order = current_user.orders.where(state: 'paid').find(params[:id])
    booking = @order.booking

    if booking.apartment.city != current_user.rofile.city
      key = "525ecc9ded3b4ee7b86531fa4c7be047"
      url= "https://public-api.blablacar.com/api/v2/trips?key=525ecc9ded3b4ee7b86531fa4c7be047&locale=fr_FR" + "&fn=" + current_user.profile.city + "&tn=" + booking.apartment.city

      serialized = open(url).read
      json = JSON.parse(serialized)
      cheapest = json['trips'][0]

      json['trips'].each do |trip|
        cheapest = trip if trip['price_with_commission']['value'].to_i < cheapest['price_with_commission']['value'].to_i
      end

      @trip = cheapest
    end
  end
end
