class AddOrdersToBookings < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :booking, index: true
  end
end
