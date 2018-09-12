class OrdersController < ApplicationController
  skip_after_action :verify_authorized

  def create
  booking = Booking.find(params[:booking_id])
  order  = Order.create!(apartment_sku: booking.id, amount: (booking.days * 6).round, state: 'pending', user: current_user)

  redirect_to new_order_payment_path(order)
  end

  def show
    @order = current_user.orders.where(state: 'paid').find(params[:id])
  end
end
