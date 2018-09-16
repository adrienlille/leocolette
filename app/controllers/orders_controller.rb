class OrdersController < ApplicationController
  skip_after_action :verify_authorized

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
  end
end
