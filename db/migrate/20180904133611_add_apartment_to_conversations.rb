class AddApartmentToConversations < ActiveRecord::Migration[5.1]
  def change
    add_reference :conversations, :apartment, index: true
  end
end
